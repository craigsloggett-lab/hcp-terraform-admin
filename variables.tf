variable "terraform_version" {
  type        = string
  description = "The version of Terraform to use in all workspaces."
  default     = "1.14.0"
}

variable "admins_team_emails" {
  type        = set(string)
  description = "A list of member email addresses for the admins team."
  default     = ["craig.sloggett@hashicorp.com"]
}

variable "github_organization_name" {
  type        = string
  description = "The name of the GitHub organization used to configure the VCS provider."
  default     = "craigsloggett-lab"
}
