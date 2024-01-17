# Fabric Capacity

module "fabric_capacity" {
  source            = "github.com/Azure/azure-data-labs-modules/terraform/fabric/fabric-capacity"

  basename          = local.safe_basename
  resource_group_id = module.resource_group[0].id
  location          = local.location

  sku               = "F2"
  admin_email       = "<>"

  tags = local.tags
}
