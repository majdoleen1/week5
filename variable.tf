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
  default     = "app"
  type = string
}
variable "public_vm_password" {
  description = "Control Node Password"
  type        = string
  default     = "P@$$w0rd1234!"
}