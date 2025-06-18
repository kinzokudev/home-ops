terraform {
  required_providers {
    onepassword = {
      source  = "1Password/onepassword"
      version = "2.1.2"
    }

    authentik = {
      source  = "goauthentik/authentik"
      version = "2025.6.0"
    }
  }
}

provider "onepassword" {
  url   = var.OP_CONNECT_HOST
  token = var.OP_CONNECT_TOKEN
}

data "onepassword_vault" "secrets" {
  name = "secrets"
}

module "onepassword_authentik" {
  source = "github.com/joryirving/terraform-1password-item"
  vault  = data.onepassword_vault.secrets.name
  item   = "authentik"
}

provider "authentik" {
  # api_token = module.onepassword_cloudflare.fields["CLOUDFLARE_API_TOKEN_TF"]
  url   = "https://auth.${var.CLUSTER_DOMAIN}"
  token = module.onepassword_authentik.fields["AUTHENTIK_API_TOKEN"]
}
