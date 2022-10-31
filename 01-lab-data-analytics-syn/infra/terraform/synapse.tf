# # Synapse workspace

module "synapse_workspace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/synapse/synapse-workspace"

  basename             = local.basename
  rg_name              = module.resource_group.name
  location             = module.resource_group.location
  adls_id              = module.storage_account_syn.adls_id
  storage_account_id   = module.storage_account_syn.id
  storage_account_name = module.storage_account_syn.name
  key_vault_id         = module.key_vault.id
  key_vault_name       = module.key_vault.name

  subnet_id                = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids_sql = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.sql.azuresynapse.net"].id] : null
  private_dns_zone_ids_dev = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.dev.azuresynapse.net"].id] : null

  synadmin_username = var.synadmin_username
  synadmin_password = var.synadmin_password

  aad_login = {
    name      = var.aad_login.name
    object_id = var.aad_login.object_id
    tenant_id = var.aad_login.tenant_id
  }

  module_enabled = true
  is_sec_module  = var.enable_private_endpoints

  tags = local.tags
}

# Synapse Private Link Hub

module "synapse_private_link_hub" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/synapse/synapse-private-link-hub"

  basename = local.basename
  rg_name  = module.resource_group.name
  location = var.location

  subnet_id            = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.azuresynapse.net"].id] : null

  module_enabled = var.enable_private_endpoints

  tags = local.tags
}

# Synapse Spark pool

module "synapse_spark_pool" {
  source = "github.com/Azure/azure-data-labs-modules.git//terraform/synapse/synapse-spark-pool"

  basename             = local.basename
  synapse_workspace_id = module.synapse_workspace.id

  module_enabled = var.enable_synapse_spark_pool
}

# Synapse SQL pool

module "synapse_sql_pool" {
  source = "github.com/Azure/azure-data-labs-modules.git//terraform/synapse/synapse-sql-pool"

  basename             = local.basename
  synapse_workspace_id = module.synapse_workspace.id

  module_enabled = var.enable_synapse_sql_pool
}