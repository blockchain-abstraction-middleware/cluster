resource "digitalocean_kubernetes_cluster" "main" {
  name    = "${var.cluster_name}"
  region  = "fra1"
  version = "1.15.4-do.0"


  node_pool {
    name       = "api-go"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}

resource "null_resource" "get_kube_config" {
  depends_on = ["digitalocean_kubernetes_cluster.main"]

  triggers = {
    cluster_instance_id = "${digitalocean_kubernetes_cluster.main.id}"
  }

  provisioner "local-exec" {
    command = "echo '${digitalocean_kubernetes_cluster.main.kube_config.0.raw_config}' >> ~/.kube/config"
  }
}
