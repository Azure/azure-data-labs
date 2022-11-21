# # Synapse workspace

module "databricks_workspace" {
  #source = "github.com/Azure/azure-data-labs-modules/terraform/databricks/"
  source = "github.com/Azure/azure-data-labs-modules/terraform/azure-data-labs-modules/terraform/databricks"

  basename             = local.basename
  rg_name              = module.resource_group.name
  location             = module.resource_group.location

  virtual_network_id                                   = module.virtual_network.id
  public_subnet_name                                   = module.subnet_adb_private.name
  public_subnet_network_security_group_association_id  = module.subnet_adb_public_security_group_association.id
  private_subnet_name                                  = module.subnet_adb_public.name
  private_subnet_network_security_group_association_id = module.subnet_adb_private_security_group_association.id

  subnet_id            = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.azuredatabricks.net"].id] : null

  is_sec_module            = var.enable_private_endpoints
  maximum_network_security = false
  public_network_enabled   = var.enable_private_endpoints

  tags = local.tags
}