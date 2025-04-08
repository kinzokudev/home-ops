resource "cloudflare_dns_record" "main" {
  name = "@"
  proxied = true
  ttl = 1
  type = "CNAME"
  content = "kinzokudev.github.io"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "www_main" {
  name = "www"
  proxied = true
  ttl = 1
  type = "CNAME"
  content = "kinzokudev.github.io"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "blog" {
  name = "blog"
  proxied = true
  ttl = 1
  type = "CNAME"
  content = "kinzokudev.github.io"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "mc" {
  name = "mc"
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "variety-enhancement.gl.at.ply.gg"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_primary_key" {
  name = "key1._domainkey"
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "key1.kinzoku.dev._domainkey.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_secondary_key" {
  name = "key2._domainkey"
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "key2.kinzoku.dev._domainkey.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_tertiary_key" {
  name = "key3._domainkey"
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "key3.kinzoku.dev._domainkey.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_autoconfig" {
  name = "autoconfig"
  proxied = false
  ttl = 1
  type = "CNAME"
  content = "autoconfig.migadu.com"
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}
