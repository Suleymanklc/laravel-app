resource "null_resource" "update_kubeconfig" {
       triggers = {
         always = timestamp()
       }
       depends_on = [
         module.eks
       ]
       provisioner "local-exec" {
          command = <<EOT
            aws eks --region '${var.region}' update-kubeconfig --name '${var.cluster_name}'
          EOT
          }
 }