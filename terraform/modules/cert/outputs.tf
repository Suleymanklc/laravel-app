output "arn" {
  description = "The ID of the created VPC"
  value       = aws_acm_certificate.cert.arn
}