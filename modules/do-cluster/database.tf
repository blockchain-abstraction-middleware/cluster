resource "digitalocean_database_cluster" "pg" {
  name       = "postgres-db"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}
