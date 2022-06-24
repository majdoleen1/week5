variable name{
  description = "DB Server name"
  type = string
}

variable location{
  description = "DB Server location"
  type = string
}

variable ver{
  description = "DB Server version"
  type = string
}

variable resource_group_name{
  description = "VM location"
  type = string
}

variable zone{
  description = "VM location"
  type = string
}

variable storage_mb{
  description = "VM location"
  type        = number
}

variable sku_name{
  description = "VM location"
  type        = string
}

variable "administrator_login" {
  description = ""
  type        = string
}

variable "administrator_password" {
  description = ""
  type        = string
}
variable "delegated_subnet_id" {
  description = ""
  type        = string
}

variable "virtual_network_id" {
  description = ""
  type        = string
}