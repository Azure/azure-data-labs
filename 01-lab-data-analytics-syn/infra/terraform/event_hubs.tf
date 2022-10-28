module "event_hubs_namespace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/event-hubs/event-hubs-namespace"

  basename = local.basename
  rg_name  = module.resource_group.name
  location = module.resource_group.location

  subnet_id            = module.subnet_default.id
  private_dns_zone_ids = [module.private_dns_zones.list["privatelink.servicebus.windows.net"].id]

  module_enabled = false
  is_sec_module  = var.enable_sec

  tags = local.tags
}