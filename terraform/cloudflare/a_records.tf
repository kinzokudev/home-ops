resource "cloudflare_dns_record" "main" {
  name = "kinzoku.dev"
  proxied = true
  ttl = 1
  type = "A"
  content = module.onepassword_cloudflare.fields["VERCEL_IPV4_ADDRESS"]
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}
