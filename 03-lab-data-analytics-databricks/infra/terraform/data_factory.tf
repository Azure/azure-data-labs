# Data Factory

module "data_factory" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/data-factory"

  basename = local.basename
  rg_name  = module.resource_group.name
  location = module.resource_group.location

  subnet_id                   = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids_df     = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.datafactory.azure.net"].id] : null
  private_dns_zone_ids_portal = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.adf.azure.com"].id] : null

  module_enabled = var.enable_data_factory
  is_sec_module  = var.enable_private_endpoints

  tags = local.tags
}