# Expone el ID de la máquina virtual creada por este módulo
output "vm_id" {
  description = "ID de la máquina virtual" 
  value       = azurerm_virtual_machine.vm.id
}
