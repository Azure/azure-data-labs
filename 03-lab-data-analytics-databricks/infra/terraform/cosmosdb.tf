module "cosmosdb-account" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/cosmosdb/cosmosdb-account?ref=v1.5.0&depth=1"

  basename            = local.basename
  resource_group_name = local.resource_group_name
  location            = local.location

  module_enabled = var.enable_cosmosdb

  tags = local.tags
}

module "cosmosdb-sql-database" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/cosmosdb/cosmosdb-sql-database?ref=v1.5.0&depth=1"

  basename            = local.basename
  resource_group_name = local.resource_group_name
  location            = local.location

  module_enabled      = var.enable_cosmosdb
  is_private_endpoint = var.enable_private_endpoints

  subnet_id            = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.documents.azure.com"].id] : null

  cosmosdb_account_name = module.cosmosdb-account.name
  cosmosdb_account_id   = module.cosmosdb-account.id

  tags = local.tags
}