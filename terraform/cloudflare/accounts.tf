resource "cloudflare_account_member" "nikita_member" {
  account_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ACCOUNT_TAG"]
  email = module.onepassword_creds.fields["CLOUDFLARE_ACCOUNT_TAG"]
}
