# Virtual network

module "virtual_network" {
  source = "github.com/microsoft/azure-labs-modules/terraform/virtual-network"

  basename      = local.basename
  rg_name       = module.resource_group.name
  location      = module.resource_group.location
  address_space = ["10.0.0.0/16"]

  tags = local.tags
}

# Subnets

module "subnet_default" {
  source = "github.com/microsoft/azure-labs-modules/terraform/subnet"

  name                                           = "snet-${var.prefix}-${var.postfix}-default"
  rg_name                                        = module.resource_group.name
  vnet_name                                      = module.virtual_network.name
  address_prefixes                               = ["10.0.1.0/24"]
  enforce_private_link_endpoint_network_policies = true
}

module "subnet_bastion" {
  source = "github.com/microsoft/azure-labs-modules/terraform/subnet"

  name             = "AzureBastionSubnet"
  rg_name          = module.resource_group.name
  vnet_name        = module.virtual_network.name
  address_prefixes = ["10.0.10.0/27"]
}