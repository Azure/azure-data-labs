# Data Explorer

module "kusto_cluster" {
  source                        = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/data-explorer/kusto-cluster?ref=v1.5.0&depth=1"
  #source                        = "../../../../azure-data-labs-modules/terraform/data-explorer/kusto-cluster/"
  basename                      = local.safe_basename
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  is_private_endpoint           = var.enable_private_endpoints
  subnet_id                     = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids          = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.westeurope.kusto.windows.net"].id] : null
  module_enabled                = var.enable_data_explorer
  public_network_access_enabled = var.public_network_enabled
  tags                          = local.tags
}

module "kusto_database" {
  source              = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/data-explorer/kusto-database?ref=v1.5.0&depth=1"
  basename            = local.safe_basename
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  cluster_name        = module.kusto_cluster.name
  module_enabled      = var.enable_data_explorer
  tags                = local.tags

  count = var.enable_data_explorer ? 1 : 0
}