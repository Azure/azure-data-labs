# Private DNS zones

module "private_dns_zones" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/private-dns-zone?ref=v1.5.0&depth=1"

  resource_group_name = var.enable_private_endpoints ? module.resource_group_global_dns[0].name : null

  vnet_id   = var.enable_private_endpoints ? module.virtual_network.id : null
  dns_zones = local.dns_zones

  count = var.enable_private_endpoints ? 1 : 0

  tags = local.tags
}