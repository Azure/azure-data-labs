module "resource_group" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/resource-group"

  basename = local.basename
  location = var.location

  tags = local.tags
}