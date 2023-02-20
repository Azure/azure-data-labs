# Container registry

module "container_registry" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/container-registry"

  basename      = local.safe_basename
  rg_name       = module.resource_group.name
  location      = module.resource_group.location
  sku           = "Premium"
  admin_enabled = true

  subnet_id            = module.subnet_default.id
  private_dns_zone_ids = [module.private_dns_zones.list["privatelink.azurecr.io"].id]

  is_sec_module = var.enable_private_endpoints

  tags = local.tags
}