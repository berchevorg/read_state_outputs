resource "random_pet" "name" {
 length    = "9"
 separator = "-"
}



#data "terraform_remote_state" "workspace-output" {
#  backend = "remote"

#  config = {
#    organization = "georgiman-tfc4b"
#    workspaces = {
#      name = "outputs"
#    }
 # }
#}

#output "consume_sensitive_value" {
#  value = data.terraform_remote_state.workspace-output.outputs.random_pet_name
#}


terraform {
  required_providers {
    tfe = {
      version = "= 0.64.0"
    }
  }
}

data "tfe_outputs" "foo" {
  organization = "georgi-berchev"
  workspace = "outputs"
}

resource "tfe_workspace" "test" {
  name         = data.tfe_outputs.foo.values
  organization = "georgi-berchev"
}


