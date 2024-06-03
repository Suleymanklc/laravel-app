output "arn" {
  description = "The ID of the created VPC"
  value       = aws_acm_certificate.self_signed_cert.arn
}