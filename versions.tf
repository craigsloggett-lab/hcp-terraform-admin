terraform {
  # Version v1.7.0 is the first version to introduce the `terraform test` command.
  required_version = "~> 1.7"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.71.0"
    }
    utilities = {
      source  = "craigsloggett/utility-functions"
      version = "0.2.0"
    }
  }
}
