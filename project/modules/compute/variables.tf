# Variable para el nombre de la máquina virtual
variable "vm_name" {}

# Variable para la ubicación de los recursos
variable "location" {}

# Variable para el nombre del grupo de recursos
variable "resource_group" {}

# Variable para el ID de la subred donde se desplegará la VM
variable "subnet_id" {}

# Variable para el ID de la IP pública asociada a la VM
variable "public_ip_id" {}

# Variable para el tamaño de la máquina virtual
variable "vm_size" {}

# Variable para el usuario administrador de la VM
variable "admin_user" {}

# Variable para la contraseña del usuario administrador de la VM
variable "admin_password" {}
