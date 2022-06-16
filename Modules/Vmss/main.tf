terraform {
  required_version =  ">= 1"
}


#Creates WEB Linux Virtual Machine Scale Set
resource "azurerm_linux_virtual_machine_scale_set" "vmss-web-server" {
  name                        = var.name # WEB Server Virtual Machine
  resource_group_name         = var.resource_group_name
  location                    = var.region
  instances                   = var.instances
  sku                         = var.sku
  admin_username              = var.username
  admin_password              = var.password
  platform_fault_domain_count = var.fault_domains
  disable_password_authentication = false
  lifecycle {
    ignore_changes = [instances]
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name          = "vnet-nic01"
    primary       = true

    ip_configuration {
      name        = "publicIp-vnet-nic01"
      primary     = true
      subnet_id   = var.subnet
      load_balancer_backend_address_pool_ids  =  var.load_balancer_backend_address

    }
  }
}