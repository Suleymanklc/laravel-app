resource "null_resource" "generate_self_signed_cert" {
  provisioner "local-exec" {
    command = <<EOT
      openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout self_signed_key.pem -out self_signed_cert.pem -subj "/CN=mylaravel.com"
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

data "local_file" "self_signed_cert" {
  filename = "${path.module}/self_signed_cert.pem"
}

data "local_file" "self_signed_key" {
  filename = "${path.module}/self_signed_key.pem"
}
resource "aws_acm_certificate" "self_signed_cert" {
  private_key       = data.local_file.self_signed_key.content
  certificate_body  = data.local_file.self_signed_cert.content

  tags = {
    Name = "self-signed-cert"
  }

  depends_on = [null_resource.generate_self_signed_cert]
}
