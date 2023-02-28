module "event_hubs_namespace" {
  source               = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/event-hubs/event-hubs-namespace?ref=main"

  basename             = local.basename
  rg_name              = module.resource_group.name
  location             = module.resource_group.location

  subnet_id            = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.servicebus.windows.net"].id] : null

  module_enabled       = var.enable_event_hub_namespace
  is_sec_module        = var.enable_private_endpoints

  tags                 = local.tags
}

module "event_hubs" {
  source         = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/event-hubs/event-hubs?ref=main"

  basename       = local.basename
  rg_name        = module.resource_group.name
  namespace_name = module.event_hubs_namespace.name

  module_enabled = var.enable_event_hub_namespace
}