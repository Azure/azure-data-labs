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
