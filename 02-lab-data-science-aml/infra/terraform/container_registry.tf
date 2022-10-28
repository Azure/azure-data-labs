# Container registry

module "container_registry" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/container-registry"

  basename      = local.basename
  rg_name       = module.resource_group.name
  location      = module.resource_group.location
  sku           = "Premium"
  admin_enabled = true

  subnet_id            = module.subnet_default.id
  private_dns_zone_ids = [module.private_dns_zones.list["privatelink.azurecr.io"].id]

  firewall_default_action       = "Deny"
  public_network_access_enabled = false

  is_sec_module = var.enable_sec

  tags = local.tags
}