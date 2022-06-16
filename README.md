## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.56.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.1 |

## Modules


| Name | Source | Version |
|------|--------|---------|
| <a name="module_Create_Networking_resource_group"></a> [Create\_Networking\_resource\_group](#module\_Create\_Networking\_resource\_group) | ./Modules/RG/ | n/a |
| <a name="module_Create_virtual_Network"></a> [Create\_virtual\_Network](#module\_Create\_virtual\_Network) | ./Modules/Vnet | n/a |
| <a name="module_create_Scale_set_VMSS"></a> [create\_Scale\_set\_VMSS](#module\_create\_Scale\_set\_VMSS) | ./modules/vmss/ | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.avset](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/availability_set) | resource |
| [azurerm_lb.azurerm_lb](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backend_pool](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_rule.azurerm_lb_rule](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine.frontendServer](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.postgresMachine](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.network_interface_app](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.network_interface_db](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.be_nsg_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.fe_nsg_assoc0](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.fe_nsg_assoc1](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.fe_nsg_assoc2](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.backend_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.public_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.frontend_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.backend_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/subnet) | resource |
| [azurerm_subnet.frontend_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.weight_app_network](https://registry.terraform.io/providers/hashicorp/azurerm/2.56.0/docs/resources/virtual_network) | resource |
| [random_pet.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_administrator_password"></a> [db\_administrator\_password](#input\_db\_administrator\_password) | DB Administrator Password | `string` | p@ssw0rd42|    no    |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | DB Administrator Username | `any` |postgres |    no    |
| <a name="input_public_vm_password"></a> [public\_vm\_password](#input\_public\_vm\_password) | Control Node Password | `string` | P@$$w0rd1234! |    no    |
| <a name="input_public_vm_username"></a> [public\_vm\_username](#input\_public\_vm\_username) | Control Node username | `string` |app |    no    |
| <a name="input_region"></a> [region](#input\_region) | Project's region | `string` | eastus |   yes    |
| <a name="input_username"></a> [username](#input\_username) | Control Node VM username | `string` | vmss |    no    |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | Condrol Node VM Password | `string` | P@$$w0rd1234! |    no    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_password"></a> [password](#output\_password) | output "username" { value = admin\_username } |
