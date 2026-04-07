terraform{
  required_version = ">= 1.14.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
      //hi
    }
  } 
  cloud { 
    
    organization = "sal180" 

    workspaces { 
      name = "terraform-azure-cicd" 
    } 
  } 
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "random_string" "unique" {
  length  = 8
  upper   = false
  special = false
}
resource "azurerm_resource_group" "rg" {
  name     = "811-ce290f4f-provide-continuous-delivery-with-gith"
  location = "southcentralus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "stg${random_string.unique.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
