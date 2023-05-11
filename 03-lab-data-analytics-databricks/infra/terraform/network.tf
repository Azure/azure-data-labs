# Virtual network

module "virtual_network" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/virtual-network?ref=v1.5.0&depth=1"

  basename            = local.basename
  resource_group_name = local.resource_group_name
  location            = local.location
  address_space       = ["10.0.0.0/16"]

  tags = local.tags
}

# Subnets

module "subnet_default" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=v1.5.0&depth=1"

  name                                      = "snet-${var.prefix}-${var.postfix}-default"
  resource_group_name                       = local.resource_group_name
  vnet_name                                 = var.enable_private_endpoints ? module.virtual_network.name : null
  address_prefixes                          = ["10.0.1.0/24"]
  private_endpoint_network_policies_enabled = true

  count = var.enable_private_endpoints ? 1 : 0
}

module "subnet_bastion" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=v1.5.0&depth=1"

  name                = "AzureBastionSubnet"
  resource_group_name = local.resource_group_name
  vnet_name           = var.enable_private_endpoints ? module.virtual_network.name : null
  address_prefixes    = ["10.0.10.0/27"]

  count = var.enable_jumphost ? 1 : 0
}

module "network_security_group" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/network-security-group?ref=v1.5.0&depth=1"

  basename            = "nsg-${var.prefix}-${var.postfix}"
  location            = local.location
  resource_group_name = local.resource_group_name
}

module "subnet_adb_public" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=v1.5.0&depth=1"

  name                = "snet-${var.prefix}-${var.postfix}-adb-public"
  resource_group_name = local.resource_group_name
  vnet_name           = module.virtual_network.name
  address_prefixes    = ["10.0.2.0/24"]
  subnet_delegation = { "adb-snet-del-pub" : [{
    name = "Microsoft.Databricks/workspaces",
    actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
    ]
    }
  ] }
}

module "subnet_adb_public_security_group_association" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet-network-security-group-association?ref=v1.5.0&depth=1"

  subnet_id                 = module.subnet_adb_public.id
  network_security_group_id = module.network_security_group.id
}

module "subnet_adb_private" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet?ref=v1.5.0&depth=1"

  name                = "snet-${var.prefix}-${var.postfix}-adb-private"
  resource_group_name = local.resource_group_name
  vnet_name           = module.virtual_network.name
  address_prefixes    = ["10.0.3.0/24"]
  subnet_delegation = { "adb-snet-del-pri" : [{
    name = "Microsoft.Databricks/workspaces",
    actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
    ]
    }
  ] }
}

module "subnet_adb_private_security_group_association" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/subnet-network-security-group-association?ref=v1.5.0&depth=1"

  subnet_id                 = module.subnet_adb_private.id
  network_security_group_id = module.network_security_group.id
}