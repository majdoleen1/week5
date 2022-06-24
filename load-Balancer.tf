
resource "azurerm_public_ip" "PublicIPForLB" {
  name                 = "publicIPForLB"
  allocation_method    = "Static"
  sku                  = "Standard"
  location             = var.region
  resource_group_name  = module.Create_Networking_resource_group.name
}

resource "azurerm_lb" "lbe_vmss" {
  name                 =  "lbe_vmss-${terraform.workspace}"
  sku                  = "Standard"
  location             = var.region
  resource_group_name  = module.Create_Networking_resource_group.name

  depends_on = [module.Create_Networking_resource_group.name, azurerm_public_ip.PublicIPForLB]

 frontend_ip_configuration {
   name                 = "frontend-PublicIPAddress-${terraform.workspace}"

   public_ip_address_id = azurerm_public_ip.PublicIPForLB.id
 }
}

resource "azurerm_lb_backend_address_pool" "lbe_address_pool" {
  loadbalancer_id = azurerm_lb.lbe_vmss.id
  name            = "frontend-PublicIPAddress-${terraform.workspace}"
}

resource "azurerm_lb_probe" "lbe_probe" {
  loadbalancer_id     = azurerm_lb.lbe_vmss.id
  name                = "lbe_probe"
  port                = 8080
}


resource "azurerm_lb_rule" "rule_lbe" {
  loadbalancer_id                = azurerm_lb.lbe_vmss.id
  name                           = "LBRule-${terraform.workspace}"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  frontend_ip_configuration_name = "frontend-PublicIPAddress-${terraform.workspace}"
  probe_id                       = azurerm_lb_probe.lbe_probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lbe_address_pool.id]
}