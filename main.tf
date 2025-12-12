# The discovery module acts as a data source for all of the identifiers being imported.
module "discovery" {
  source  = "craigsloggett/discovery/tfe"
  version = "0.14.0"
}
