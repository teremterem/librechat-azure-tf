data "cloudflare_zone" "default" {
  zone_id = var.cloudflare_zone_id
}

resource "cloudflare_dns_record" "librechat" {
  zone_id = data.cloudflare_zone.default.id
  name    = var.host
  content = azurerm_container_app.librechat.ingress[0].fqdn
  type    = "CNAME"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "verification" {
  zone_id = data.cloudflare_zone.default.id
  name    = "asuid.chat"
  content = azurerm_container_app.librechat.custom_domain_verification_id
  type    = "TXT"
  proxied = false #
  ttl     = 1
}
