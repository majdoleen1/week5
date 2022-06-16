variable name{
  description = "Resource name"
  type = string
}
variable resource_group_name{
  description = "resource group name"
  type        = string
}

variable instances{
  description = "Number of VM instances"
  type        = number
}

variable region{
  description = "VM location"
  type        = string
}

variable sku{
  description = "Machine Type"
  type        = string
}

variable username{
  description = "VM Username"
  type        = string
}

variable password{
  description = "VM Password"
  type        = string
}

variable fault_domains{
  description = "Number of racks for high availability"
  type        = number
}


variable subnet{
  type = string
}

variable load_balancer_backend_address{
  type = list(string)
}