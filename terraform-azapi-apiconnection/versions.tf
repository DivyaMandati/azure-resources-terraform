terraform {
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = ">= 1.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "azapi" {}

provider "azurerm" {
  features {}
}
