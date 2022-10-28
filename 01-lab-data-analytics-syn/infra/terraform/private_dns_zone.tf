# Private DNS zones

module "private_dns_zones" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/private-dns-zone"

  rg_name = module.resource_group_global_dns.name

  vnet_id   = module.virtual_network.id
  dns_zones = local.dns_zones

  count = var.is_sec_enabled ? 1 : 0

  tags = local.tags
}