# Resource group

module "resource_group" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/resource-group?ref=v1.5.0&depth=1"

  basename = local.basename
  location = var.location

  count = local.enable_ade_deployment ? 0 : 1

  tags = local.tags
}

module "resource_group_global_dns" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/resource-group?ref=v1.5.0&depth=1"

  basename = "${local.basename}-global-dns"
  location = var.location

  count = var.enable_private_endpoints ? 1 : 0

  tags = local.tags
}