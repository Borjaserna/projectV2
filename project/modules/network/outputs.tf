# Expone el ID de la red virtual creada por este módulo
output "network_id" {
  description = "ID de la red virtual"
  value       = azurerm_virtual_network.vnet.id
}

# Expone el ID de la IP pública creada para la VM
output "vm_public_ip" {
  description = "Dirección IP pública de la VM"
  value       = azurerm_public_ip.vm_ip.id
}

output "subnet_id" {
  description = "ID de la subred privada"
  value       = azurerm_subnet.private_subnet.id
}

output "lb_public_ip" {
  value = azurerm_public_ip.lb_ip.id
}