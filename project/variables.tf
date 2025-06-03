# Variable para el nombre del grupo de recursos en Azure
variable "resource_group_name" {
  description = "Nombre del grupo de recursos en Azure"
  type        = string
  default     = "rg-security-monitoring"
}

# Variable para la ubicación donde se desplegarán los recursos
variable "location" {
  description = "Ubicación del despliegue"
  type        = string
  default     = "East US"
}

# Variable para el tamaño de la máquina virtual
variable "vm_size" {
  description = "Tamaño de la máquina virtual"
  type        = string
  default     = "Standard_DS1_v2"
}

# Variable para el nombre del usuario administrador de la VM
variable "admin_user" {
  description = "Usuario administrador de la VM"
  type        = string
  default     = "adminuser"
}

# Variable para la contraseña del usuario administrador de la VM
variable "admin_password" {
  description = "Contraseña del usuario administrador"
  type        = string
  default     = "YourSecurePassword123!"
}
