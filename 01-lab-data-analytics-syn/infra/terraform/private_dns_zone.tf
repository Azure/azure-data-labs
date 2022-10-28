# Private DNS zones

module "private_dns_zones" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/private-dns-zone"

  rg_name = var.is_sec_enabled ? module.resource_group_global_dns[0].name : null

  vnet_id   = var.is_sec_enabled ? module.virtual_network[0].id : null
  dns_zones = local.dns_zones

  count = var.is_sec_enabled ? 1 : 0

  tags = local.tags
}