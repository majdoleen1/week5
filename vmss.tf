# Creates a Scale-set VM
module "create_Scale_set_VMSS"{
  source                          = "./modules/vmss/"
  name                            = "vmss"
  resource_group_name             = module.Create_Networking_resource_group.name
  sku                             = "Standard_b1s"
  region                          = var.region
  instances                       = 1
  fault_domains                   = 2
  username                        = "vmss"
  password                        = "P@$$w0rd1234!"
  subnet                          = azurerm_subnet.public_subnet.id
  load_balancer_backend_address   = [azurerm_lb_backend_address_pool.lbe_address_pool.id]
}