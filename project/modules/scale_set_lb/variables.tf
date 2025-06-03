# Variable para la ubicación de los recursos
variable "location" {}

# Variable para el nombre del grupo de recursos
variable "resource_group" {}

# Variable para el ID de la subred
variable "subnet_id" {}

# Variable para el ID de la IP pública
variable "public_ip_id" {}

# Variable para el tamaño de la VM
variable "vm_size" {}

# Variable para el usuario administrador
variable "admin_user" {}

# Variable para la contraseña del usuario administrador
variable "admin_password" {}

# Número de instancias del Scale Set
variable "vmss_instances" {
  description = "Número de instancias en el Scale Set"
  type        = number
  default     = 2
}