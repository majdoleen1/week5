# Creates a virtual network
module "Create_virtual_Network"{
  source                = "./Modules/Vnet"
  name                  = "vnet"
  resource_group_name   = module.Create_Networking_resource_group.name
  location              = var.region
  address_space         = ["10.0.0.0/16"]
}

# Creates a Public subnet
resource "azurerm_subnet" "public_subnet" {
  name                  = "public_subnet"
  resource_group_name   = module.Create_Networking_resource_group.name
  virtual_network_name  = module.Create_virtual_Network.name #var.name.vnet
  address_prefixes      = ["10.0.1.0/24"]
}

# Creates a Private subnet
resource "azurerm_subnet" "private_subnet" {
  name                 = "private_subnet" # Private Subnet
  resource_group_name  = module.Create_Networking_resource_group.name
  virtual_network_name = module.Create_virtual_Network.name #var.name.vnet
  address_prefixes     = ["10.0.2.0/24"]
}

# create a nic for single vm
resource "azurerm_network_interface" "network_interface" {
  name                = "nic"
  location            = var.region
  resource_group_name = module.Create_Networking_resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-vm.id
  }
}
# create public ip for single vm
resource "azurerm_public_ip" "pip-vm" {
  name                    = "Public_ip_vm"
  resource_group_name     = module.Create_Networking_resource_group.name
  location                = var.region
  allocation_method       = "Static"
  sku  = "Standard"
  tags = {
    environment = "Production"
  }
}
# Create DB Network Interface
resource "azurerm_network_interface" "db_nic" {
  name                = "db-NIC"
  location            = var.region
  resource_group_name = module.Create_Networking_resource_group.name
  #

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.private_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "postgresMachine" {

  name                = "postgresMachine"
  resource_group_name = module.Create_Networking_resource_group.name
  location            = var.region
  size                = "Standard_b1s"
  admin_username      = var.db_username
  admin_password      = var.db_administrator_password

  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.db_nic.id
    ,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}