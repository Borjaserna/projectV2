terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
     # Permite que Terraform elimine el resource group aunque contenga recursos dentro.
      # Si está en 'false', fuerza el borrado completo del grupo y todos sus recursos.
      # Útil para automatización, pero con precaución.
