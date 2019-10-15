# Outputs kubeconfig to connect to k8s cluster
output "cluster_id" {
  value = "${digitalocean_kubernetes_cluster.main.id}"
}
# Output the details to connect to the DB
output "uri" {
  value = "${digitalocean_database_cluster.pg.uri}"
}