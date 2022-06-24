module "Create_A_VM" {
  source = "./Modules/VM"
  name                            = "vm-${terraform.workspace}"
  resource_group_name             = module.Create_Networking_resource_group.name
  location                        = var.region
  size                            = "Standard_b1s"
  admin_username                  = var.public_vm_username
  admin_password                  = var.public_vm_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.network_interface.id,]
}