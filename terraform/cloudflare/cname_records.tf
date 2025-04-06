resource "cloudflare_dns_record" "mc" {
  name = "mc"
  allow_overwrite = true
  proxied = false
  ttl = 1
  type = "CNAME"
  content = module.onepassword_cloudflare.fields["MC_PLAYIT_IP"]
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_primary_key" {
  name = "key1._domainkey"
  allow_overwrite = true
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "key1.kinzoku.dev._domainkey.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_secondary_key" {
  name = "key2._domainkey"
  allow_overwrite = true
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "key2.kinzoku.dev._domainkey.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_tertiary_key" {
  name = "key3._domainkey"
  allow_overwrite = true
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "key3.kinzoku.dev._domainkey.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_autoconfig" {
  name = "autoconfig"
  allow_overwrite = true
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "autoconfig.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}
