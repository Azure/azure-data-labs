# SQL Database

module "sql_server" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/sql-database-server"

  basename            = local.safe_basename
  resource_group_name = local.resource_group_name
  location            = local.location

  db_version                   = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  is_private_endpoint = local.enable_private_endpoints

  tags = local.tags
}

module "sql_db" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/sql-database"

  for_each  = var.metastore_sku
  basename  = join("", ["sqldb", local.safe_basename, each.key])
  server_id = module.sql_server.id

  tags = local.tags
}

# resource "azurerm_sql_database" "hdi_sqldb_metastore" {
#   for_each                         = var.metastore_sku
#   name                             = join("", ["sqldb", local.safe_prefix, local.safe_postfix, each.key])
#   resource_group_name              = local.resource_group_name
#   location                         = local.location
#   server_name                      = module.sql_server.name
#   edition                          = "Standard"
#   requested_service_objective_name = each.value

#   tags = local.tags
# }

resource "azurerm_sql_firewall_rule" "metastore_server_rule" {
  name                = "AllowAzureServices"
  resource_group_name = local.resource_group_name
  server_name         = module.sql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}