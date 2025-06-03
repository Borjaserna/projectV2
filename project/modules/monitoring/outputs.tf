# Expone el ID del Workspace de Log Analytics creado por este módulo
output "log_analytics_workspace_id" {
  description = "ID del Workspace de Log Analytics"
  value       = azurerm_log_analytics_workspace.log_analytics.id
}
