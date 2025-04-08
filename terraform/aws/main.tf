terraform {
  required_version = "1.11.2"
  required_providers {
    onepassword = {
      source = "1Password/onepassword"
      version = "2.1.2"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
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

module "onepassword_aws" {
  source = "github.com/joryirving/terraform-1password-item"
  vault = data.onepassword_vault.secrets.name
  item = "aws"
}

provider "aws" {
  region = "us-east-1"
  access_key = module.onepassword_aws.fields["AWS_ACCESS_KEY"]
  secret_key = module.onepassword_aws.fields["AWS_SECRET_KEY"]
}
