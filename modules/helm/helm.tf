provider "helm" {
  install_tiller  = true
  service_account = "tiller"
}

# This is hacky, for some reason helm doesn't install with the `provider`
resource "null_resource" "install_helm" {
  provisioner "local-exec" {
    command = "helm init --service-account tiller"
  }
}
