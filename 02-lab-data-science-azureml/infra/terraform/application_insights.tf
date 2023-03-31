# Appplication insights

module "application_insights" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/application-insights"

  basename            = local.basename
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  application_type    = "web"

  tags = local.tags
}