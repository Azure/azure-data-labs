module "event_hubs_namespace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/event-hubs/event-hubs-namespace"

  basename = local.basename
  rg_name  = module.resource_group.name
  location = module.resource_group.location

  subnet_id            = local.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids = local.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.servicebus.windows.net"].id] : null

  module_enabled = local.enable_event_hub
  is_sec_module  = local.enable_private_endpoints

  tags = local.tags
}