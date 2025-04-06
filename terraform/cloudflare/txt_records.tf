resource "cloudflare_dns_record" "email_dmarc" {
  name = "_dmarc"
  allow_overwrite = true
  ttl = 1
  type = "TXT"
  proxied = false
  content = "\"v=DMARC1; p=quarantine;\""
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_main_txt" {
  name = "@"
  allow_overwrite = true
  ttl = 1
  type = "TXT"
  proxied = false
  content = "\"v=spf1 include:spf.migadu.com -all\""
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_verification" {
  name = "@"
  allow_overwrite = true
  ttl = 1
  type = "TXT"
  proxied = false
  content = "\"hosted-email-verify=hei5y4nt\""
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}
