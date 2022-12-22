terraform {
  backend "azurerm" {
    subscription_id      = "a992010e-1b2b-40ce-b4d3-715bc18ebbf8"
    tenant_id            = "16b3c013-d300-468d-ac64-7eda0820b6d3"
    resource_group_name  = "rg-adl-terraform-state"
    storage_account_name = "stadlterraformstatejdc"
    container_name       = "default"
    key                  = "azlabs03.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      version = "= 3.29.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "a992010e-1b2b-40ce-b4d3-715bc18ebbf8"
  tenant_id       = "16b3c013-d300-468d-ac64-7eda0820b6d3"
}

data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me"
}


