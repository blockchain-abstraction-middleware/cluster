provider "postgresql" {
  host            = "${var.host}"
  port            = "${var.port}"
  database        = "${var.database}"
  username        = "${var.user}"
  password        = "${var.password}"
  sslmode         = "require"
  connect_timeout = 15
}

module "database_tables" { 
  source        = "../../../modules/database-tables" 
}

provider "helm" {
  install_tiller = true
  service_account = "helm"
}

provider "kubernetes" {
}

module "cluster_helm" { 
  source        = "../../../modules/helm" 
}