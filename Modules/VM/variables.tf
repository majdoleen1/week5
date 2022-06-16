variable disable_password_authentication{
  description = "disable_password_authentication"
  type = string
}

variable network_interface_ids{
  description = "network_interface_ids"
  type = list(string)
}

variable name{
  description = "Resource name"
  type = string
}
variable resource_group_name{
  description = "resource group name"
  type        = string
}

variable admin_username{
  description = "VM Username"
  type        = string
}

variable admin_password{
  description = "VM Password"
  type        = string
}

variable location{
  description = "VM location"
  type        = string
}

variable size{
  description = "Machine Type"
  type        = string
}