provider "digitalocean" {
  token = "${var.do_token}"
}
module "k8s_cluster" {
  source       = "../../../modules/do-cluster"
  cluster_name = "staging"
}
output "cluster_id" {
  value = "${module.k8s_cluster.cluster_id}"
}
output "uri" {
  value = "${module.k8s_cluster.uri}"
}
