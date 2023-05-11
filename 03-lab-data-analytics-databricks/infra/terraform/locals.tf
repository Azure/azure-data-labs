locals {
  tags = {
    Owner       = "Azure Data Labs"
    Project     = "Azure Data Labs"
    Environment = "dev"
    Toolkit     = "Terraform"
    Template    = "data-analytics-databricks"
    Name        = "${var.prefix}"
  }

  dns_zones = [
    "privatelink.sql.azuresynapse.net",
    "privatelink.dev.azuresynapse.net",
    "privatelink.azuresynapse.net",
    "privatelink.blob.core.windows.net",
    "privatelink.file.core.windows.net",
    "privatelink.dfs.core.windows.net",
    "privatelink.vaultcore.azure.net",
    "privatelink.servicebus.windows.net",
    "privatelink.datafactory.azure.net",
    "privatelink.adf.azure.com",
    "privatelink.database.windows.net",
    "privatelink.azuredatabricks.net",
    "privatelink.documents.azure.com",
    "privatelink.${local.location}.kusto.windows.net"
  ]

  safe_prefix  = replace(var.prefix, "-", "")
  safe_postfix = replace(var.postfix, "-", "")

  basename      = "${var.prefix}-${var.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"

  config = yamldecode(file("${path.module}/../../config-lab.yml"))

  resource_group_name = local.config.variables.enable_ade_deployment == "true" ? var.resource_group_name : length(module.resource_group) > 0 ? module.resource_group[0].name : ""
  location            = local.config.variables.location != null ? local.config.variables.location : var.location
  prefix              = local.config.variables.prefix != null ? local.config.variables.prefix : var.prefix
  postfix             = local.config.variables.postfix != null ? local.config.variables.postfix : var.postfix

  enable_private_endpoints   = local.config.variables.enable_private_endpoints != null ? local.config.variables.enable_private_endpoints : var.enable_private_endpoints
  enable_jumphost            = local.config.variables.enable_jumphost != null ? local.config.variables.enable_jumphost : var.enable_jumphost
  public_network_enabled     = local.config.variables.public_network_enabled != null ? local.config.variables.public_network_enabled : var.public_network_enabled
  enable_ip_access_list      = local.config.variables.enable_ip_access_list != null ? local.config.variables.enable_ip_access_list : var.enable_ip_access_list
  enable_data_factory        = local.config.variables.enable_data_factory != null ? local.config.variables.enable_data_factory : var.enable_data_factory
  enable_event_hub_namespace = local.config.variables.enable_event_hub_namespace != null ? local.config.variables.enable_event_hub_namespace : var.enable_event_hub_namespace
  enable_cosmosdb            = local.config.variables.enable_cosmosdb != null ? local.config.variables.enable_cosmosdb : var.enable_cosmosdb
  enable_data_explorer       = local.config.variables.enable_data_explorer != null ? local.config.variables.enable_data_explorer : var.enable_data_explorer

  enable_ade_deployment = local.config.variables.enable_ade_deployment
}