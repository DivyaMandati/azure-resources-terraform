output "connection_id" {
  value = azapi_resource.api_connection.id
}

output "connection_runtime_url" {
  value = azapi_resource.api_connection.output.properties.connectionRuntimeUrl
}
