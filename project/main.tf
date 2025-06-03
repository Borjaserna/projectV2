# Define el grupo de recursos
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Invoca el módulo de red
module "network" {
  source         = "./modules/network"
  vnet_name      = "vnet-security"
  location       = var.location
  resource_group = azurerm_resource_group.main.name
}

# Invoca el módulo de cómputo (si lo sigues usando para VM individual)
module "compute" {
  source          = "./modules/compute"
  vm_name         = "vm-security"
  location        = var.location
  resource_group  = azurerm_resource_group.main.name
  subnet_id       = module.network.subnet_id
  public_ip_id    = module.network.vm_public_ip
  vm_size         = var.vm_size
  admin_user      = var.admin_user
  admin_password  = var.admin_password
}

# Invoca el módulo de Scale Set y Load Balancer
module "scale_set_lb" {
  source         = "./modules/scale_set_lb"
  location       = var.location
  resource_group = azurerm_resource_group.main.name
  subnet_id      = module.network.subnet_id
  public_ip_id   = module.network.lb_public_ip
  vm_size        = var.vm_size
  admin_user     = var.admin_user
  admin_password = var.admin_password
  vmss_instances = 2
}

# Invoca el módulo de monitoreo
module "monitoring" {
  source         = "./modules/monitoring"
  workspace_name = "log-analytics-workspace"
  location       = var.location
  resource_group = azurerm_resource_group.main.name
  vm_id          = module.compute.vm_id
}