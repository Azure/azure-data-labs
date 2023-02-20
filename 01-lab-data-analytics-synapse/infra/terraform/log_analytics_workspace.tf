# Log Analytics workspace

module "log_analytics_workspace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/log-analytics/log-analytics-workspace"

  basename = local.basename
  rg_name  = module.resource_group.name
  location = module.resource_group.location

  tags = local.tags
}