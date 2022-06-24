# Create a PaaS flexible DB
module "Create_postgresql_flexible_server" {
  source                    = "./Modules/Managed_psql_db_server/"
  ver                       = "13"
  zone                      = "1"
  sku_name                  = "B_Standard_B1ms"
  storage_mb                = 32768

  name                      = "psql-db-${terraform.workspace}"
  resource_group_name       = module.Create_managed_psql_DB_resource_group.name
  location                  = var.region

  administrator_login       = var.db_username
  administrator_password    = var.db_administrator_password

  virtual_network_id        = module.Create_virtual_Network.id
  delegated_subnet_id       = azurerm_subnet.private_subnet.id
  depends_on                = [module.Create_managed_psql_DB_resource_group]

}