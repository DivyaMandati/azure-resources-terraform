resource "azapi_resource" "api_connection" {
  type      = "Microsoft.Web/connections@2016-06-01"
  name      = "${lower(var.api_type)}${lower(var.environment)}"
  parent_id = var.resource_group_id
  location  = var.location

  schema_validation_enabled = false

  body = {
    kind = "V2",
    properties = {
      displayName           = var.connection_user,
      parameterValues       = {},
      customParameterValues = {},
      api                   = lookup(local.api_definitions, var.api_type, var.custom_api_field)
      testLinks             = []
    }
  }

  response_export_values = [
    "properties.connectionRuntimeUrl"
  ]

  tags = var.tags

  lifecycle {
    ignore_changes = [
      body.properties.overallStatus,
      body.properties.statuses,
      body.properties.connectionState,
      body.properties.createdTime,
      body.properties.changedTime,
      body.properties.api,
      body.properties.authenticatedUser
    ]
    replace_triggered_by = [
      null_resource.api_connection
    ]
  }
}

resource "null_resource" "api_connection" {
  triggers = {
    type = var.api_type
  }
}

resource "azapi_resource" "api_connection_access" {
  for_each = var.principal_ids

  type      = "Microsoft.Web/connections/accessPolicies@2016-06-01"
  name      = each.key
  parent_id = azapi_resource.api_connection.id
  location  = var.location

  schema_validation_enabled = false

  body = {
    properties = {
      principal = {
        type = "ActiveDirectory"
        identity = {
          objectId = each.value
          tenantId = data.azurerm_subscription.current.tenant_id
        }
      }
    }
  }

  lifecycle {
    replace_triggered_by = [
      null_resource.api_connection_access[each.key],
      azapi_resource.api_connection
    ]
  }
}

resource "null_resource" "api_connection_access" {
  for_each = var.principal_ids

  triggers = {
    ids = each.value
  }
}
