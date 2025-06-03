# Expone el ID de la máquina virtual creada por este módulo
output "vm_id" {
  description = "ID de la máquina virtual" # Describe la salida para mayor claridad
  value       = azurerm_virtual_machine.vm.id # Devuelve el ID de la VM creada por el recurso principal
}
