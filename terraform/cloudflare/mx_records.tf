resource "cloudflare_dns_record" "email_primary" {
  name = "@"
  allow_overwrite = true
  ttl = 1
  type = "MX"
  priority = 10
  content = "aspmx1.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_secondary" {
  name = "@"
  allow_overwrite = true
  ttl = 1
  type = "MX"
  priority = 20
  content = "aspmx2.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}
