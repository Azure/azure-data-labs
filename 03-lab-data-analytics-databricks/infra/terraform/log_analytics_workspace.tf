module "log_analytics_workspace" {
  source                     = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/log-analytics/log-analytics-workspace?ref=v1.4.0"
  basename                   = local.basename
  rg_name                    = module.resource_group.name
  location                   = module.resource_group.location

  internet_ingestion_enabled = !var.enable_private_endpoints
  internet_query_enabled     = !var.enable_private_endpoints

  tags                       = local.tags
}