module "Create_Networking_resource_group" {
  source    = "./Modules/RG/"
  name      ="rg-networking"
  region    = var.region
}