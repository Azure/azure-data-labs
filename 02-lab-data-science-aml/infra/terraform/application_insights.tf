# Appplication insights

module "application_insights" {
  source = "github.com/microsoft/azure-labs-modules/terraform/application-insights"

  basename         = local.basename
  rg_name          = module.resource_group.name
  location         = module.resource_group.location
  application_type = "web"

  tags = local.tags
}