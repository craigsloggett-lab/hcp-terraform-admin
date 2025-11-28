# The discovery module is essentially a data source for all of the identifiers being imported.
module "discovery" {
  source  = "app.terraform.io/craigsloggett-lab/discovery/tfe"
  version = "0.12.3"
}
