locals {
  tags = {
    Owner       = "Azure Data Labs"
    Project     = "Azure Data Labs"
    Environment = "dev"
    Toolkit     = "Terraform"
    Template    = "data-insights-syn"
    Name        = "${var.prefix}"
  }

  dns_zones = [
    "privatelink.sql.azuresynapse.net",
    "privatelink.dev.azuresynapse.net",
    "privatelink.azuresynapse.net",
    "privatelink.blob.core.windows.net",
    "privatelink.dfs.core.windows.net",
    "privatelink.vaultcore.azure.net",
    "privatelink.servicebus.windows.net",
    "privatelink.datafactory.azure.net",
    "privatelink.adf.azure.com",
    "privatelink.database.windows.net"
  ]

  safe_prefix  = replace(local.prefix, "-", "")
  safe_postfix = replace(local.postfix, "-", "")

  basename      = "${local.prefix}-${local.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"

  # Configuration

  config = yamldecode(file("${path.module}/../../config-lab.yml"))

  location = local.config.variables.location != null ? local.config.variables.location : var.location
  prefix   = local.config.variables.prefix != null ? local.config.variables.prefix : var.prefix
  postfix  = local.config.variables.postfix != null ? local.config.variables.postfix : var.postfix

  enable_private_endpoints        = local.config.variables.enable_private_endpoints != null ? local.config.variables.enable_private_endpoints : var.enable_private_endpoints
  enable_jumphost                 = local.config.variables.enable_jumphost != null ? local.config.variables.enable_jumphost : var.enable_jumphost
  enable_synapse_sql_pool         = local.config.variables.enable_synapse_sql_pool != null ? local.config.variables.enable_synapse_sql_pool : var.enable_synapse_sql_pool
  enable_synapse_spark_pool       = local.config.variables.enable_synapse_spark_pool != null ? local.config.variables.enable_synapse_spark_pool : var.enable_synapse_spark_pool
  enable_data_factory             = local.config.variables.enable_data_factory != null ? local.config.variables.enable_data_factory : var.enable_data_factory
  enable_analysis_services_server = local.config.variables.enable_analysis_services_server != null ? local.config.variables.enable_analysis_services_server : var.enable_analysis_services_server
  enable_event_hub                = local.config.variables.enable_event_hub != null ? local.config.variables.enable_event_hub : var.enable_event_hub
}