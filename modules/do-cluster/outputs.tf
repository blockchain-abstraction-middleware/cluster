# Outputs kubeconfig to connect to k8s cluster
output "cluster_id" {
  value = "${digitalocean_kubernetes_cluster.main.id}"
}
# Output the details to connect to the DB
output "host" {
  value = "${digitalocean_database_cluster.pg.host}"
}
output "port" {
  value = "${digitalocean_database_cluster.pg.port}"
}
output "database" {
  value = "${digitalocean_database_cluster.pg.database}"
}
output "user" {
  value = "${digitalocean_database_cluster.pg.user}"
}
output "password" {
  value = "${digitalocean_database_cluster.pg.password}"
}
output "uri" {
  value = "${digitalocean_database_cluster.pg.uri}"
}