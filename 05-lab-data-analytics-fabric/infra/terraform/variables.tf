variable "location" {
  type        = string
  description = "Location of the resource group and modules"
  default     = "North Europe"
}

variable "prefix" {
  type        = string
  description = "Prefix for module names"
  default     = "adl"
}

variable "postfix" {
  type        = string
  description = "Postfix for module names"
  default     = "102"
}

# Feature flags

variable "enable_private_endpoints" {
  type        = bool
  description = "Is secure enabled?"
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "Variable for ADE based deployment"
  default     = "rg-j6de-001342"
}