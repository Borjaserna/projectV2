# Crea el Load Balancer público
resource "azurerm_lb" "main" {
  name                = "lb-security"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = var.public_ip_id
  }
}

# Backend pool para el Scale Set
resource "azurerm_lb_backend_address_pool" "main" {
  name                = "backend-pool"
  loadbalancer_id     = azurerm_lb.main.id
}

# Virtual Machine Scale Set
resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name                = "vmss-security"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.vm_size
  instances           = var.vmss_instances #Número de instancias del Scale Set definido en variables.tf

  admin_username      = var.admin_user
  admin_password      = var.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name_prefix = "vmss"
    admin_username       = var.admin_user
    admin_password       = var.admin_password
  }

  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids  = [azurerm_lb_backend_address_pool.main.id]
    }
  }
}

resource "azurerm_lb_rule" "rdp" {
  name                           = "RDP"
  loadbalancer_id                = azurerm_lb.main.id
  protocol                      = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.main.id
  probe_id                      = azurerm_lb_probe.rdp.id
}

resource "azurerm_lb_probe" "rdp" {
  name                = "rdp-probe"
  resource_group_name = var.resource_group
  loadbalancer_id     = azurerm_lb.main.id
  protocol            = "Tcp"
  port                = 3389
}