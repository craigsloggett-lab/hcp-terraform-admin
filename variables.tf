variable "hcp_terraform_organization_name" {
  type        = string
  description = "The name of the HCP Terraform organization being managed."
  default     = "craigsloggett-lab"
}

variable "hcp_terraform_organization_email" {
  type        = string
  description = "The notification email address for the HCP Terraform organization being managed."
  default     = "craig.sloggett@hashicorp.com"
}

variable "hcp_terraform_admins_team_name" {
  type        = string
  description = "The name of the team of users who administer the HCP Terraform organization."
  default     = "admins"
}

variable "hcp_platform_team_project_name" {
  type        = string
  description = "The name of the project used to manage HashiCorp Cloud Platform services."
  default     = "Platform Team"
}

variable "hcp_terraform_admin_workspace_name" {
  type        = string
  description = "The name of the workspace used to manage this HCP Terraform organization."
  default     = "hcp-terraform-admin"
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform to use in all workspaces."
  default     = "1.10.3"
}
