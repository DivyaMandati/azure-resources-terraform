provider "azurerm" {
  features {
    key_vault {
      # This is required because soft_delete_enabled on the actual keyvault resource is deprecated
      purge_soft_delete_on_destroy = true
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  required_version = ">= 1.6.6"
}

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

locals {
  location = "uksouth"
  tags = {
    application      = "sas-automation-tf-test-pipeline"
    service-offering = "sas-automation-tf-test-pipeline"
    project          = "sas-automation-tf-test-pipeline"
    owner            = "sas-automation-tf-test-pipeline"
  }
}

resource "azurerm_resource_group" "sas_automation_tf_test_pipeline" {
  name     = "sas-automation-test-${random_string.random.result}"
  location = local.location
  tags     = local.tags
}

resource "azurerm_storage_account" "logic_app_storage" {
  name                     = "sasatftest${random_string.random.result}"
  location                 = local.location
  resource_group_name      = azurerm_resource_group.sas_automation_tf_test_pipeline.name
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_service_plan" "logic_app_plan" {
  name                = "sp-la-tf-test-pipeline"
  location            = local.location
  resource_group_name = azurerm_resource_group.sas_automation_tf_test_pipeline.name

  os_type  = "Windows"
  sku_name = "WS1"

  tags = local.tags
}

resource "azurerm_logic_app_standard" "test_app" {
  name                = "la-tf-test-pipeline"
  location            = local.location
  resource_group_name = azurerm_resource_group.sas_automation_tf_test_pipeline.name

  app_service_plan_id = azurerm_service_plan.logic_app_plan.id

  storage_account_name       = azurerm_storage_account.logic_app_storage.name
  storage_account_access_key = azurerm_storage_account.logic_app_storage.primary_access_key

  version    = "~4"
  https_only = true

  site_config {
    dotnet_framework_version         = "v8.0"
    runtime_scale_monitoring_enabled = true
    use_32_bit_worker_process        = false
    public_network_access_enabled    = false
  }

  app_settings = {
    # Azure
    FUNCTIONS_WORKER_RUNTIME = "dotnet"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}

output "resource_group_name" {
  value = azurerm_resource_group.sas_automation_tf_test_pipeline.name
}

output "resource_group_id" {
  value = azurerm_resource_group.sas_automation_tf_test_pipeline.id
}

output "resource_group_location" {
  value = azurerm_resource_group.sas_automation_tf_test_pipeline.location
}

output "logicapp_principal_id" {
  value = azurerm_logic_app_standard.test_app.identity[0].principal_id
}

output "tags" {
  value = local.tags
}
