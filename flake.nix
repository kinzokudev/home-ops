{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    talhelper.url = "github:budimanjojo/talhelper";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;

      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
      pkgsFor =
        system:
        import nixpkgs {
          inherit system;
          overlays = [
            inputs.talhelper.overlays.default
            (_: prev: {
              custom =
                (prev.custom or { })
                // (import ./nix/pkgs {
                  inherit (prev) pkgs;
                  inherit inputs;
                });
            })
          ];
          config.allowUnfree = true;
        };
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = pkgs.mkShell rec {
            nativeBuildInputs = with pkgs; [
              mise
              python313
              dig
              kdash
              uv
              talhelper
              custom.cilium-cli
              cloudflared
              cue
              age
              sops
              custom.fluxcd
              go-task
              # kubernetes-helm
              # helmfile
              # jq
              # kustomize
              # yq-go
              # kubeconform
              # makejinja
              # python313Packages.netaddr
            ];
            buildInputs = nativeBuildInputs;
          };
        }
      );
    };
}
