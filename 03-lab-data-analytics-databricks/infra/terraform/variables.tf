variable "location" {
  type        = string
  description = "Location of the resource group and modules"
}

variable "prefix" {
  type        = string
  description = "Prefix for module names"
}

variable "postfix" {
  type        = string
  description = "Postfix for module names"
}

variable "jumphost_username" {
  type        = string
  description = "VM username"
  default     = "azureuser"
}

variable "jumphost_password" {
  type        = string
  description = "VM password"
  default     = "ThisIsNotVerySecure!"
}

# Feature flags

variable "enable_private_endpoints" {
  type        = bool
  description = "Is secure enabled?"
  default     = false
}

variable "public_network_enabled" {
  type        = bool
  description = "Should the Databricks portal be visible through the public network"
  default     = true
}

variable "enable_ip_access_list" {
  type        = bool
  description = "Should access to the Databricks portal be restricted to the local IP address"
  default     = false
}

variable "enable_jumphost" {
  type        = bool
  description = "Is jumphost required?"
  default     = false
}

variable "enable_data_factory" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_event_hub_namespace" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_cosmosdb" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

variable "enable_data_explorer" {
  type        = bool
  description = "Variable to enable or disable the module"
  default     = false
}

# ADE Integration

variable "resource_group_name" {
  type        = string
  description = "Variable for ADE based deployment"
  default     = "rg-ade-lab03"
}