# module "event_hubs_namespace" {
#   source = "github.com/microsoft/azure-labs-modules/terraform/event-hubs/event-hubs-namespace"

#   rg_name  = module.resource_group.name
#   location = module.resource_group.location

#   prefix  = var.prefix
#   postfix = var.postfix

#   subnet_id            = module.subnet_default.id
#   private_dns_zone_ids = [module.private_dns_zones.list["privatelink.servicebus.windows.net"].id]

#   module_enabled = false

#   tags = local.tags
# }