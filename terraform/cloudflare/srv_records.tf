resource "cloudflare_dns_record" "email_imap_incoming" {
  name = "_imaps._tcp.kinzoku.dev"
  ttl = 1
  type = "SRV"
  priority = 0
  data = {
    weight = 1
    port = 993
    target = "imap.migadu.com"
  }
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_pop3_incoming" {
  name = "_pop3s._tcp.kinzoku.dev"
  ttl = 1
  type = "SRV"
  priority = 0
  data = {
    weight = 1
    port = 995
    target = "pop.migadu.com"
  }
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_smtp_outgoing" {
  name = "_submissions._tcp.kinzoku.dev"
  ttl = 1
  type = "SRV"
  priority = 0
  data = {
    weight = 1
    port = 465
    target = "smtp.migadu.com"
  }
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}

resource "cloudflare_dns_record" "email_outlook_autodiscover" {
  name = "_autodiscover._tcp.kinzoku.dev"
  ttl = 1
  type = "SRV"
  priority = 0
  data = {
    weight = 1
    port = 443
    target = "autodiscover.migadu.com"
  }
  zone_id = module.onepassword_cloudflare.fields["CLOUDFLARE_ZONE_ID"]
}
