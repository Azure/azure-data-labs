# Virtual network

module "virtual_network" {
  source        = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/virtual-network?ref=main"

  basename      = local.basename
  rg_name       = module.resource_group.name
  location      = module.resource_group.location
  address_space = ["10.0.0.0/16"]

  tags          = local.tags
}

# Subnets

module "subnet_default" {
  source                                    = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=main"

  name                                      = "snet-${var.prefix}-${var.postfix}-default"
  rg_name                                   = module.resource_group.name
  vnet_name                                 = var.enable_private_endpoints ? module.virtual_network.name : null
  address_prefixes                          = ["10.0.1.0/24"]
  private_endpoint_network_policies_enabled = true

  count                                     = var.enable_private_endpoints ? 1 : 0
}

module "subnet_bastion" {
  source           = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=main"

  name             = "AzureBastionSubnet"
  rg_name          = module.resource_group.name
  vnet_name        = var.enable_private_endpoints ? module.virtual_network.name : null
  address_prefixes = ["10.0.10.0/27"]

  count            = var.enable_jumphost ? 1 : 0
}

module "network_security_group" {
  source   = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/network-security-group?ref=main"

  basename = "nsg-${var.prefix}-${var.postfix}"
  location = module.resource_group.location
  rg_name  = module.resource_group.name
}

module "subnet_adb_public" {
  source            = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=main"

  name              = "snet-${var.prefix}-${var.postfix}-adb-public"
  rg_name           = module.resource_group.name
  vnet_name         = module.virtual_network.name
  address_prefixes  = ["10.0.2.0/24"]
  subnet_delegation = { "adb-snet-del-pub" : [{
    name    = "Microsoft.Databricks/workspaces",
    actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
    ]
    }
  ] }
}

module "subnet_adb_public_security_group_association" {
  source                    = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet-network-security-group-association?ref=main"

  subnet_id                 = module.subnet_adb_public.id
  network_security_group_id = module.network_security_group.id
}

module "subnet_adb_private" {
  source            = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=main"

  name              = "snet-${var.prefix}-${var.postfix}-adb-private"
  rg_name           = module.resource_group.name
  vnet_name         = module.virtual_network.name
  address_prefixes  = ["10.0.3.0/24"]
  subnet_delegation = { "adb-snet-del-pri" : [{
    name    = "Microsoft.Databricks/workspaces",
    actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
    ]
    }
  ] }
}

module "subnet_adb_private_security_group_association" {
  source                    = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet-network-security-group-association?ref=main"

  subnet_id                 = module.subnet_adb_private.id
  network_security_group_id = module.network_security_group.id
}