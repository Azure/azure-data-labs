# Data Factory

module "data_factory" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/data-factory"

  basename = local.basename
  rg_name  = module.resource_group.name
  location = module.resource_group.location

  subnet_id                   = module.subnet_default[0].id
  private_dns_zone_ids_df     = [module.private_dns_zones[0].list["privatelink.datafactory.azure.net"].id]
  private_dns_zone_ids_portal = [module.private_dns_zones[0].list["privatelink.adf.azure.com"].id]

  module_enabled = var.enable_data_factory
  is_sec_module  = var.is_sec_enabled

  tags = local.tags
}