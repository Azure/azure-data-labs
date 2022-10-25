# Private DNS zones

module "private_dns_zones" {
  source = "github.com/microsoft/azure-labs-modules/terraform/private-dns-zone"

  rg_name = module.resource_group_global_dns.name

  vnet_id   = module.virtual_network.id
  dns_zones = local.dns_zones

  tags = local.tags
}