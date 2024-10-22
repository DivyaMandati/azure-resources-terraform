run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "verify_sharepoint" {
  variables {
    environment       = "dev"
    resource_group_id = run.setup_tests.resource_group_id
    location          = run.setup_tests.resource_group_location
    tags              = run.setup_tests.tags
    api_type          = "sharepointonline"
    connection_user   = "srv-sasa-tfpipeline-dev@ukhomeoffice.onmicrosoft.com"
    principal_ids     = { testapp = run.setup_tests.logicapp_principal_id }
  }

  assert {
    condition = alltrue([
      azapi_resource.api_connection.output.properties.connectionRuntimeUrl != null,
      length(azapi_resource.api_connection.output.properties.connectionRuntimeUrl) > 0
    ])
    error_message = "Connetion URL does not exist for the API connection."
  }

  assert {
    condition = alltrue([
      azapi_resource.api_connection_access["testapp"].parent_id == azapi_resource.api_connection.id,
      azapi_resource.api_connection_access["testapp"].body.properties.principal.identity.objectId == var.principal_ids["testapp"]
    ])
    error_message = "Logic app not correctly granted access to the API Connection."
  }
}
