resource "postgresql_database" "terraform_backend" {
  name              = "terraform_backend"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
}
