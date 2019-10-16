provider "helm" {
  install_tiller  = true
  service_account = "tiller"
}

# This is hacky, for some reason helm doesn't install with the `provider`
resource "null_resource" "install_helm" {
  triggers = {
    update = "${var.kubernetes_service_account_id}"
  }
  provisioner "local-exec" {
    command = "helm init --service-account tiller"
  }
}
