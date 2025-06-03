# Expone el ID de la red virtual creada por el módulo de red
output "network_id" {
  description = "ID de la red virtual creada"
  value       = module.network.network_id
}

# Expone la dirección IP pública de la máquina virtual
output "vm_public_ip" {
  description = "Dirección IP pública de la VM"
  value       = module.network.vm_public_ip
}

# Expone el ID de la máquina virtual creada por el módulo de cómputo
output "vm_id" {
  description = "ID de la máquina virtual creada"
  value       = module.compute.vm_id
}

# Expone el ID del Workspace de Log Analytics creado por el módulo de monitoreo
output "log_analytics_workspace_id" {
  description = "ID del Workspace de Log Analytics"
  value       = module.monitoring.log_analytics_workspace_id
}
