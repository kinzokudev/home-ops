resource "cloudflare_dns_record" "main" {
  name = "kinzoku.dev"
  proxied = false
  ttl = 1
  type = "A"
  content = module.onepassword_cloudflare.fields["VERCEL_IPV4_ADDRESS"]
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "www_main" {
  name = "www"
  proxied = false
  ttl = 1
  type = "A"
  content = module.onepassword_cloudflare.fields["VERCEL_IPV4_ADDRESS"]
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}
