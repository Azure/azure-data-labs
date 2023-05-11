# Data Explorer

module "kusto_cluster" {
  source                        = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/data-explorer/kusto-cluster?ref=main"
  basename                      = local.safe_basename
  resource_group_name           = var.resource_group_name
  location                      = var.location
  is_private_endpoint           = var.enable_private_endpoints
  subnet_id                     = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids          = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.${var.location}.kusto.windows.net"].id] : null
  module_enabled                = var.enable_data_explorer
  public_network_access_enabled = var.public_network_enabled
  tags                          = local.tags
}

module "kusto_database" {
  source              = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/data-explorer/kusto-database?ref=main"
  basename            = local.safe_basename
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = module.kusto_cluster.name
  module_enabled      = var.enable_data_explorer
  tags                = local.tags

  count = var.enable_data_explorer ? 1 : 0
}