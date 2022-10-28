# Storage Account

module "storage_account_syn" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/storage-account"

  basename     = "${local.basename}-syn"
  rg_name      = module.resource_group.name
  location     = module.resource_group.location
  account_tier = "Standard"

  subnet_id                 = var.is_sec_enabled ? module.subnet_default[0].id : null
  private_dns_zone_ids_blob = var.is_sec_enabled ? [module.private_dns_zones[0].list["privatelink.blob.core.windows.net"].id] : null
  private_dns_zone_ids_file = var.is_sec_enabled ? [module.private_dns_zones[0].list["privatelink.file.core.windows.net"].id] : null

  hns_enabled             = false
  firewall_default_action = "Allow"
  firewall_ip_rules       = [data.http.ip.body]
  firewall_bypass         = ["AzureServices"]

  module_enabled = true
  is_sec_module  = var.is_sec_enabled

  tags = local.tags
}