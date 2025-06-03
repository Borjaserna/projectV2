# Expone el ID del Load Balancer
output "lb_id" {
  description = "ID del Load Balancer"
  value       = azurerm_lb.main.id
}

# Expone el ID del Scale Set
output "vmss_id" {
  description = "ID del Virtual Machine Scale Set"
  value       = azurerm_linux_virtual_machine_scale_set.vmss.id
}