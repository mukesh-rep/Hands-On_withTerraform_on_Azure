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
  name     = "ti7VC3l1LVvCyA.atlasv1.tPGTpUJZojoqL8uelY96H64LG0a2v1b0W9l3GZTeuzdm9HLlf3209qm2QpEJNld3BhQ"
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