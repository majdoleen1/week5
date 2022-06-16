terraform {
  required_version =  ">=0.15.0"
}

resource "azurerm_virtual_network" "vnet" {
name                = var.name
resource_group_name = var.resource_group_name
location            = var.location
address_space       = var.address_space
}