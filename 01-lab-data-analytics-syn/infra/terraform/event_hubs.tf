module "event_hubs_namespace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/event-hubs/event-hubs-namespace"

  basename = local.basename
  rg_name  = module.resource_group.name
  location = module.resource_group.location

  subnet_id            = var.is_sec_enabled ? module.subnet_default[0].id : null
  private_dns_zone_ids = var.is_sec_enabled ? [module.private_dns_zones[0].list["privatelink.servicebus.windows.net"].id] : null

  module_enabled = false
  is_sec_module  = var.is_sec_enabled

  tags = local.tags
}