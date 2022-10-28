# Virtual network

module "virtual_network" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/virtual-network"

  basename      = local.basename
  rg_name       = module.resource_group.name
  location      = module.resource_group.location
  address_space = ["10.0.0.0/16"]

  count = var.is_sec_enabled ? 1 : 0

  tags = local.tags
}

# Subnets

module "subnet_default" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet"

  name                                           = "snet-${var.prefix}-${var.postfix}-default"
  rg_name                                        = module.resource_group.name
  vnet_name                                      = var.is_sec_enabled ? module.virtual_network[0].name : null
  address_prefixes                               = ["10.0.1.0/24"]
  enforce_private_link_endpoint_network_policies = true

  count = var.is_sec_enabled ? 1 : 0
}

module "subnet_bastion" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet"

  name             = "AzureBastionSubnet"
  rg_name          = module.resource_group.name
  vnet_name        = var.is_sec_enabled ? module.virtual_network[0].name : null
  address_prefixes = ["10.0.10.0/27"]

  count = var.is_jumphost_required ? 1 : 0
}