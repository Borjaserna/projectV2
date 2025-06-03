# Crea el Load Balancer público
resource "azurerm_lb" "main" {
  name                = "lb-security"
  location            = var.location
  resource_group = azurerm_resource_group.main.name
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
resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = "vmss-security"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.vm_size
  instances           = var.vmss_instances

  admin_username      = var.admin_user
  admin_password      = var.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
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