provider "digitalocean" {
  token = "${var.do_token}"
}
module "cluster" { 
  source        = "../../../modules/do-cluster" 
  cluster_name  = "staging"
}
output "kube_config" {
  value = "${module.cluster.kube_config}"
}
output "cluster_id" {
  value = "${module.cluster.cluster_id}"
}
output "host" {
  value = "${module.cluster.host}"
}
output "port" {
  value = "${module.cluster.port}"
}
output "database" {
  value = "${module.cluster.database}"
}
output "user" {
  value = "${module.cluster.user}"
}
output "password" {
  value = "${module.cluster.password}"
}
output "uri" {
  value = "${module.cluster.uri}"
}
