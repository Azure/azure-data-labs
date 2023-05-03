terraform {
  #backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.53.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.13.0"
    }
  }
}

provider "azurerm" {
  features {}

  skip_provider_registration = true
}

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me"
}