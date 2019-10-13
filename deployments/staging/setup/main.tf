provider "postgresql" {
  host            = "${var.host}"
  port            = "${var.port}"
  database        = "${var.database}"
  username        = "${var.user}"
  password        = "${var.password}"
  sslmode         = "require"
  connect_timeout = 15
}

provider "kubernetes" {
}

module "database_tables" {
  source = "../../../modules/database-tables"
}

module "service_accounts" {
  source = "../../../modules/service-accounts"
}

module "cluster_helm" {
  source = "../../../modules/helm"
  config = "${module.service_accounts.load_config_file}"
}
