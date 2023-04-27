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
    "privatelink.${var.location}.kusto.windows.net"
  ]

  safe_prefix   = replace(var.prefix, "-", "")
  safe_postfix  = replace(var.postfix, "-", "")
  basename      = "${var.prefix}-${var.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"
}