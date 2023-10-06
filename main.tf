terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "mukesh_org"

    workspaces {
      name = "hands-On_with_terraform_On_azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-ca6f1da2-hands-on-with-terraform-on-azure"
  location = "West US"

}

module "securestorage" {
  source  = "app.terraform.io/mukesh_org/securestorage/azurerm"
  version = "1.0.1"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "mukeshstg98543"
}