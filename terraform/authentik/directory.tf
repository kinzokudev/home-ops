locals {
  authentik_groups = {
    monitoring = { name = "Monitoring" }
    users      = { name = "Users" }
  }
}

data "authentik_group" "admins" {
  name = "authentik Admins"
}

resource "authentik_group" "grafana_admin" {
  name         = "Grafana Admins"
  is_superuser = false
}

resource "authentik_group" "default" {
  for_each     = local.authentik_groups
  name         = each.value.name
  is_superuser = false
}


resource "authentik_policy_binding" "application_policy_binding" {
  for_each = local.applications

  target = authentik_application.application[each.key].uuid
  group  = authentik_group.default[each.value.group].id
  order  = 0
}

module "onepassword_discord" {
  source = "github.com/joryirving/terraform-1password-item"
  vault  = "secrets"
  item   = "discord"
}

resource "authentik_source_oauth" "discord" {
  name                = "Discord"
  slug                = "discord"
  authentication_flow = data.authentik_flow.default-source-authentication.id
  enrollment_flow     = authentik_flow.enrollment-invitation.uuid
  user_matching_mode  = "email_deny"

  provider_type   = "discord"
  consumer_key    = module.onepassword_discord.fields["DISCORD_AUTHENTIK_CLIENT_ID"]
  consumer_secret = module.onepassword_discord.fields["DISCORD_AUTHENTIK_CLIENT_SECRET"]
}
