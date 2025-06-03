# Crea la red virtual principal
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
}

# Crea una subred privada dentro de la VNet
resource "azurerm_subnet" "private_subnet" {
  name                 = "private-subnet"
  resource_group = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Crea una IP pública para la máquina virtual
resource "azurerm_public_ip" "vm_ip" {
  name                = "vm-public-ip"
  location            = var.location
  resource_group = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
}
