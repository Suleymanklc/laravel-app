resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "self_signed_cert" {
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]

  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.private_key.private_key_pem

  subject {
    common_name  = var.domain_name
    organization = "Self-Signed Certificate"
  }

  validity_period_hours = 8760 # One year
  early_renewal_hours   = 168  # One week

  dns_names = [var.domain_name]
}

resource "local_file" "certificate_pem" {
  content  = tls_self_signed_cert.self_signed_cert.cert_pem
  filename = "${path.module}/self_signed_cert.pem"
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.private_key.private_key_pem
  filename = "${path.module}/self_signed_key.pem"
}

