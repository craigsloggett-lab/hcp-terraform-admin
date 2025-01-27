# Required
hcp_terraform_organization_name               = "craigsloggett-lab"
hcp_terraform_organization_email              = "craig.sloggett@hashicorp.com"
backend_project_name                          = "Platform Team"
backend_workspace_name                        = "hcp-terraform-admin"
tfe_provider_authentication_variable_set_name = "TFE Provider Authentication"
github_organization_name                      = "craigsloggett-lab"
backend_vcs_repository_name                   = "hcp-terraform-admin"

# Optional
terraform_version = "1.10.3"

owners_team_emails = [
  "craig.sloggett@hashicorp.com",
]

hcp_terraform_admins_team_name = "admins"

admins_team_emails = [
  "craig.sloggett@hashicorp.com",
]
