# Analysis Services

module "analysis_services" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/analysis-services-server"

  basename = local.safe_basename
  rg_name  = module.resource_group.name
  location = module.resource_group.location

  module_enabled = local.enable_analysis_services_server

  tags = local.tags
}