locals {
  tags = {
    Owner       = "Azure Data Labs"
    Project     = "Azure Data Labs"
    Environment = "dev"
    Toolkit     = "Terraform"
    Template    = "data-analytics-hdi-spark"
    Name        = "${var.prefix}"
  }

  dns_zones = [
  ]

  safe_prefix  = replace(local.prefix, "-", "")
  safe_postfix = replace(local.postfix, "-", "")

  basename      = "${local.prefix}-${local.postfix}"
  safe_basename = "${local.safe_prefix}${local.safe_postfix}"

  # Configuration

  config = yamldecode(file("${path.module}/../../config-lab.yml"))

  resource_group_name = local.config.variables.enable_ade_deployment == "true" ? var.resource_group_name : length(module.resource_group) > 0 ? module.resource_group[0].name : ""
  location            = local.config.variables.location != null ? local.config.variables.location : var.location
  prefix              = local.config.variables.prefix != null ? local.config.variables.prefix : var.prefix
  postfix             = local.config.variables.postfix != null ? local.config.variables.postfix : var.postfix

  enable_private_endpoints = local.config.variables.enable_private_endpoints != null ? local.config.variables.enable_private_endpoints : var.enable_private_endpoints

  enable_ade_deployment = local.config.variables.enable_ade_deployment
}