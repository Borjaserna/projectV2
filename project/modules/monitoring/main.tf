# Crea un Workspace de Log Analytics para monitoreo
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Crea una alerta de actividad para la VM, basada en logs administrativos
resource "azurerm_monitor_activity_log_alert" "vm_activity_logs" {
  name                = "vm-activity-alert"
  resource_group_name = var.resource_group
  location            = "global"
  scopes              = [var.vm_id]

  criteria {
    category       = "Administrative"
    operation_name = "Microsoft.Compute/virtualMachines/write"
  }

  action {
    action_group_id = azurerm_monitor_action_group.alert_action_group.id
  }
}

# Crea un grupo de acción para notificaciones de alertas
resource "azurerm_monitor_action_group" "alert_action_group" {
  name                = "vm-alerts-action-group"
  resource_group_name = var.resource_group
  short_name          = "VMAlerts"

  email_receiver {
    name          = "AdminEmail"
    email_address = "Admin@example.com"
  }
}
