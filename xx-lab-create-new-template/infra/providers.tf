terraform {
    backend "azurerm" {
      resource_group_name  = "rg-adl-terraform-state"
      storage_account_name = "stadlterraformstate"
      container_name       = "default"
      key                  = "templatesample.terraform.tfstate"
    }
  required_providers {
    azurerm = {
      version = "= 3.32.0"
    }
  }
}

provider "azurerm" {
  features {}
}