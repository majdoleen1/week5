terraform {
  required_version =  ">= 1"
}

# Create PostgreSQL Database
resource "azurerm_postgresql_flexible_server" "rg_managed_flexible_psql_db" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.location
  version                 = var.ver
  administrator_login     = var.administrator_login
  administrator_password  = var.administrator_password
  zone                    = var.zone
  storage_mb              = var.storage_mb
  sku_name                = var.sku_name
depends_on = [azurerm_private_dns_zone_virtual_network_link.dns_zone_vnet_link]
delegated_subnet_id       = var.delegated_subnet_id
private_dns_zone_id       = azurerm_private_dns_zone.private_dns_zone.id
}

# Create the private dns zone resource
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                    = "dns.zone.${terraform.workspace}.postgres.database.azure.com"
  resource_group_name     = var.resource_group_name

}

# Create a link between The vnet and the private dns zone
resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_vnet_link" {
  name                    = "vnet-link" #var.name
  resource_group_name     = var.resource_group_name
  virtual_network_id      = var.virtual_network_id
  private_dns_zone_name   = azurerm_private_dns_zone.private_dns_zone.name

  depends_on = [azurerm_private_dns_zone.private_dns_zone]
}