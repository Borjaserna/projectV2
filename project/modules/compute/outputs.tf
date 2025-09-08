# Expone el ID de la máquina virtual creada por este módulo
output "vm_id" {
  description = "ID de la máquina virtual" 
  value       = azurerm_virtual_machine.vm.id
}

# Expone el ID de la interfaz de red creada por este módulo
output "nic_id" {
  description = "ID de la interfaz de red de la VM"
  value       = azurerm_network_interface.vm_nic.id
}