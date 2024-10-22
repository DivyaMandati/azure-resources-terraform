variable "environment" {
  type        = string
  default     = "dev"
  description = "Name of the environment being deployed, ie dev/test/preprod/prod/etc."

  validation {
    condition     = contains(["dev", "test", "preprod", "prod"], var.environment)
    error_message = "Invalid environment name. Should be one of 'dev'/'test'/'preprod'/'prod'."
  }
}

variable "resource_group_id" {
  type        = string
  description = "ID of the resource group to deploy the API connection to."
}

variable "location" {
  type        = string
  default     = "UK South"
  description = "Location to deploy the resources. Should not be changed for HO resources unless needed."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to resource."
}

variable "api_type" {
  type        = string
  description = "Type of API connection to create, eg sharepoint, wordonline, etc."
}

variable "custom_api_field" {
  type        = map(string)
  default     = {}
  description = "'api' field object for API types not pre-populated for the module."
}

variable "principal_ids" {
  type        = map(string)
  default     = {}
  description = "Map of names and principal IDs of apps to allow access to the API connection."
}

variable "connection_user" {
  type        = string
  description = "User to populate the API connection with. Changing will not trigger resource replacement."
}
