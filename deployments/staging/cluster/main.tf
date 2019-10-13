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
output "host" {
  value = "${module.k8s_cluster.host}"
}
output "port" {
  value = "${module.k8s_cluster.port}"
}
output "database" {
  value = "${module.k8s_cluster.database}"
}
output "user" {
  value = "${module.k8s_cluster.user}"
}
output "password" {
  value = "${module.k8s_cluster.password}"
}
output "uri" {
  value = "${module.k8s_cluster.uri}"
}
