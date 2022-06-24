variable "region" {
  description = "Project's region"
  type        = string
  }

variable "db_username" {
  description   = "DB Administrator Username"
  default     = "postgres"
  sensitive     = true
}

variable "db_administrator_password" {
  description   = "DB Administrator Password"
  type          = string
  default     = "p@ssw0rd42"
  sensitive     = true
}
variable "public_vm_username" {
  description = "Control Node username"
  default     = "majdoleen"
  type = string
}
variable "public_vm_password" {
  description = "Control Node Password"
  type        = string
  default     = "P@$$w0rd1234!"
}
variable "username" {
  description   = "Control Node VM username"
  type          = string
  default     = "majdoleen"
}

#Uncomment this for Password prompt when applying
variable "vm_password" {
  description   = "Condrol Node VM Password"
  type          = string
  default     = "P@$$w0rd1234!"
  sensitive     = true
}
