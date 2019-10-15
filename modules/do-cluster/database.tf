resource "digitalocean_database_cluster" "pg" {
  name       = "postgres-db"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}


resource "null_resource" "set_tf_vars" {
  depends_on = ["digitalocean_database_cluster.pg"]

  triggers = {
    cluster_instance_id = "${digitalocean_database_cluster.pg.id}"
  }

  provisioner "local-exec" {
    command = "echo '{ \"host\":\"${digitalocean_database_cluster.pg.host}\", \"port\":\"${digitalocean_database_cluster.pg.port}\", \"database\":\"${digitalocean_database_cluster.pg.database}\", \"user\":\"${digitalocean_database_cluster.pg.user}\", \"password\":\"${digitalocean_database_cluster.pg.password}\" }' > input.tfvars.json"
  }
}