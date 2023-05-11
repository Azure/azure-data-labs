# Data Factory

module "data_factory" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/data-factory/data-factory?ref=v1.5.0&depth=1"

  basename            = local.basename
  resource_group_name = local.resource_group_name
  location            = local.location

  subnet_id                   = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids_df     = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.datafactory.azure.net"].id] : null
  private_dns_zone_ids_portal = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.adf.azure.com"].id] : null

  module_enabled      = var.enable_data_factory
  is_private_endpoint = var.enable_private_endpoints

  tags = local.tags
}