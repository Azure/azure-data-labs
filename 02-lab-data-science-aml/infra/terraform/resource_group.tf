# Resource group

module "resource_group" {
  source = "github.com/microsoft/azure-labs-modules/terraform/resource-group"

  basename = local.basename
  location = var.location

  tags = local.tags
}

module "resource_group_global_dns" {
  source = "github.com/microsoft/azure-labs-modules/terraform/resource-group"

  basename = "${local.basename}-global-dns"
  location = var.location

  tags = local.tags
}