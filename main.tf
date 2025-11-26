# The bootstrap module is essentially a data source for all of the identifiers being imported.
module "bootstrap" {
  source  = "app.terraform.io/craigsloggett-lab/bootstrap/tfe"
  version = "0.11.0"
}
