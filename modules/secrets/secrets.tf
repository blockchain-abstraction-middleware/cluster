resource "kubernetes_secret" "secret_key" {
  metadata {
    name = "secret-key"
    namespace = "go-apis"
  }

  data = {
    "secring.gpg" = "${file("${var.key_location}")}"
  }
}