output "tfe_provider_authentication_variable_set_name" {
  value       = data.tfe_variable_set.tfe_provider_authentication.name
  description = "The name of the TFE Provider Authentication variable set."
}

output "tfe_oauth_client_id" {
  value       = data.tfe_oauth_client.github.id
  description = "The ID of the VCS Provider configuration."
}

output "random_string" {
  value       = provider::utilities::generate_random_string(10)
  description = "Generate a random number and store it in state."
}
