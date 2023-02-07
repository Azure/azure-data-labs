locals {
  tags = {
    Owner       = "Azure Data Labs"
    Project     = "Azure Data Labs"
    Environment = "dev"
    Toolkit     = "Terraform"
    Template    = "ade-demo"
    Name        = "${var.prefix}"
  }

  dns_zones = [
    "privatelink.sql.azuresynapse.net",
    "privatelink.dev.azuresynapse.net",
    "privatelink.azuresynapse.net",
    "privatelink.blob.core.windows.net",
    "privatelink.dfs.core.windows.net",
    "privatelink.vaultcore.azure.net"
  ]

  safe_prefix  = replace(var.prefix, "-", "")
  safe_postfix = replace(var.postfix, "-", "")

  basename = "${var.prefix}-${var.postfix}"
}