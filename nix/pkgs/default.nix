{
  pkgs,
  inputs,
  ...
}:
let
  inherit (pkgs) callPackage lib;
in
{
  cilium-cli = callPackage ./cilium-cli { };
  fluxcd = callPackage ./fluxcd { };
  go-task = callPackage ./go-task { };
}
