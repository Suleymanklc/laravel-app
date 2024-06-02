output "certificate_pem" {
  value = tls_self_signed_cert.self_signed_cert.cert_pem
}

output "private_key_pem" {
  value = tls_private_key.private_key.private_key_pem
}
