# Virtual network

module "virtual_network" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/virtual-network"

  basename      = local.basename
  rg_name       = module.resource_group.name
  location      = module.resource_group.location
  address_space = ["10.0.0.0/16"]

  tags = local.tags
}

# Subnets

module "subnet_default" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet"

  name                                           = "snet-${var.prefix}-${var.postfix}-default"
  rg_name                                        = module.resource_group.name
  vnet_name                                      = var.enable_private_endpoints ? module.virtual_network.name : null
  address_prefixes                               = ["10.0.1.0/24"]
  enforce_private_link_endpoint_network_policies = true

  count = var.enable_private_endpoints ? 1 : 0
}

module "subnet_bastion" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet"

  name             = "AzureBastionSubnet"
  rg_name          = module.resource_group.name
  vnet_name        = var.enable_private_endpoints ? module.virtual_network.name : null
  address_prefixes = ["10.0.10.0/27"]

  count = var.enable_jumphost ? 1 : 0
}

module "network_security_group" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/network-security-group"

  basename  = "nsg-${var.prefix}-${var.postfix}"
  location  = module.resource_group.location
  rg_name   = module.resource_group.name
}

module "subnet_adb_public" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet"

  name              = "snet-${var.prefix}-${var.postfix}-adb-public"
  rg_name           = module.resource_group.name
  vnet_name         = module.virtual_network.name
  address_prefixes  = ["10.0.2.0/24"]
  subnet_delegation = {"adb-snet-del-pub":[{
          name = "Microsoft.Databricks/workspaces",
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/join/action",
            "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
            "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
          ]
      }
    ]}
}

module "subnet_adb_public_security_group_association" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet-network-security-group-association"

  subnet_id = module.subnet_adb_public.id
  network_security_group_id = module.network_security_group.id
}

module "subnet_adb_private" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet"

  name              = "snet-${var.prefix}-${var.postfix}-adb-private"
  rg_name           = module.resource_group.name
  vnet_name         = module.virtual_network.name
  address_prefixes  = ["10.0.3.0/24"]
  subnet_delegation =  {"adb-snet-del-pri":[{
          name = "Microsoft.Databricks/workspaces",
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/join/action",
            "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
            "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
          ]
      }
    ]}
}

module "subnet_adb_private_security_group_association" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/subnet-network-security-group-association"

  subnet_id = module.subnet_adb_private.id
  network_security_group_id = module.network_security_group.id
}