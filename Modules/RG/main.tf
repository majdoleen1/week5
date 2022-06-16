#
terraform {
  required_version =  ">= 1"
}
# Resource Group Creation Module
resource "azurerm_resource_group" "Resource_Group_Creation" {
  name     = var.name #var.name.rg_db # Week5 Resource Group
  location = var.region #var.region.db
}