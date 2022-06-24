module "Create_Networking_resource_group" {
  source    = "./Modules/RG/"
  name      ="rg-networking-${terraform.workspace}"
  region    = var.region
}
module "Create_managed_psql_DB_resource_group"{
  source    = "./Modules/RG/"
  name      = "rg-psql-flexible-managed-db-${terraform.workspace}"
  region    = var.region
}
