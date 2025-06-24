terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}



variable "location" {
  default = "westeurope"
}

resource "azurerm_resource_group" "mlops_rg" {
  name     = "rg-mlops-platform"
  location = var.location
}

# Create 3 Key Vaults: dev, qa, prod
resource "azurerm_key_vault" "dev" {
  name                        = "kv-mlops-dev"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.mlops_rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = false
}


resource "azurerm_key_vault" "qa" {
  name                        = "kv-mlops-qa"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.mlops_rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = false
}
resource "azurerm_key_vault" "prod" {
  name                        = "kv-mlops-prod"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.mlops_rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = false
}

