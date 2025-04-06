resource "cloudflare_r2_bucket" "volsync" {
  account_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ACCOUNT_TAG"]
  name = "volsync"
  location = "ENAM"
  storage_class = "Standard"
}
