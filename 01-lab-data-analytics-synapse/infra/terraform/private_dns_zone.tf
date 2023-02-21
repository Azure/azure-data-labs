# Private DNS zones

module "private_dns_zones" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/private-dns-zone"

  rg_name = local.enable_private_endpoints ? module.resource_group_global_dns[0].name : null

  vnet_id   = local.enable_private_endpoints ? module.virtual_network[0].id : null
  dns_zones = local.dns_zones

  count = local.enable_private_endpoints ? 1 : 0

  tags = local.tags
}