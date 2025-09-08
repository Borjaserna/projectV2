# Variable para el nombre de la red virtual
variable "vnet_name" {}

# Variable para la ubicación de los recursos
variable "location" {}

# Variable para el nombre del grupo de recursos
variable "resource_group" {}

# Variable para el ID de la interfaz de red
variable "nic_id" {
  description = "ID de la interfaz de red de la VM"
  type        = string
}