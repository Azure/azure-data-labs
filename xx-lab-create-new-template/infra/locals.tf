locals {
  tags = {
    Project     = "Azure/azure-data-labs-templates"
    Template    = "sample-template"
    Environment = "dev"
    Toolkit     = "Terraform"
    Name        = "${var.prefix}"
  }

  safe_prefix  = replace(var.prefix, "-", "")
  safe_postfix = replace(var.postfix, "-", "")

  basename = "${var.prefix}-${var.postfix}"
}