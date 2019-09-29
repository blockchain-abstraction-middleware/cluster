resource "digitalocean_kubernetes_cluster" "main" {
  name    = "${var.cluster_name}"
  region  = "fra1"
  version = "1.15.3-do.2"


  node_pool {
    name       = "api-go"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }

  # management {
  #   auto_repair  = true
  #   auto_upgrade = true
  # }
}