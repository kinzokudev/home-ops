terraform {
  required_providers {
    onepassword = {
      source = "1Password/onepassword"
      version = "2.1.2"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.2.0"
    }
  }
}

provider "onepassword" {
  url = var.OP_CONNECT_HOST
  token = var.OP_CONNECT_TOKEN
}

data "onepassword_vault" "secrets" {
  name = "secrets"
}

module "onepassword_cloudflare" {
  source = "github.com/joryirving/terraform-1password-item"
  vault = data.onepassword_vault.secrets.name
  item = "cloudflare"
}

module "onepassword_creds" {
  source = "github.com/joryirving/terraform-1password-item"
  vault = data.onepassword_vault.secrets.name
  item = "other_credentials"
}

provider "cloudflare" {
  api_token = module.onepassword_cloudflare.fields["CLOUDFLARE_API_TOKEN_TF"]
}
