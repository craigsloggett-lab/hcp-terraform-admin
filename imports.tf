# The bootstrap module is the source for all of the identifiers being imported.
module "bootstrap" {
  source = "git::https://github.com/craigsloggett-lab/terraform-tfe-bootstrap?ref=v0.10.1"
}

# The HCP Terraform organization.
import {
  id = module.bootstrap.tfe_organizations.this.name
  to = module.bootstrap.tfe_organization.this
}

# The members of the HCP Terraform organization.
import {
  for_each = module.bootstrap.tfe_organization_memberships

  id = each.key
  to = module.bootstrap.tfe_organization_membership.this[each.key]
}

# The "owners" team.
import {
  id = "${module.bootstrap.tfe_organizations.this.name}/${module.bootstrap.tfe_teams.owners.id}"
  to = module.bootstrap.tfe_team.owners
}

# The members of the "owners" team.
import {
  id = module.bootstrap.tfe_teams.owners.id
  to = module.bootstrap.tfe_team_organization_members.owners
}

# The "Default Project" project.
import {
  id = module.bootstrap.tfe_projects.default.id
  to = module.bootstrap.tfe_project.default
}

# Temporary
import {
  id = "prj-LMG8bhhEpUzg9rrb"
  to = tfe_project.admin
}

import {
  id = "varset-FwFGK65suTr7eaAA"
  to = tfe_variable_set.tfe_provider_authentication
}

import {
  id = "${data.tfe_organization.this.name}/varset-FwFGK65suTr7eaAA/var-3KPqVNEaAk6B6Lg5"
  to = tfe_variable.tfe_token
}

import {
  id = "ws-NJNrsMM37W7AgWNx"
  to = tfe_workspace.hcp_terraform_admin
}

import {
  id = "${data.tfe_organization.this.name}/team-AgMKArPE1pnwYpPz"
  to = tfe_team.admins
}

import {
  id = "team-AgMKArPE1pnwYpPz"
  to = tfe_team_organization_members.admins
}

import {
  id = "tprj-77bfZhj1Zqo2ttVW"
  to = tfe_team_project_access.admins_default_project
}

import {
  id = "tprj-tcWLAozsS38DjKr6"
  to = tfe_team_project_access.admins_administration
}
