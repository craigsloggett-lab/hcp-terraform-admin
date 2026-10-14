terraform {
  # Write-only arguments require Terraform 1.11 or later.
  required_version = "~> 1.11"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.82.0"
    }
  }
}
