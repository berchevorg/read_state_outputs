resource "random_pet" "name" {
 length    = "2"
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

output "consume_sensitive_value" {
  value = data.tfe_outputs.foo.values
  sensitive=true
}


# resource null_resource echo_dummy {
 #  provisioner local-exec {
  #   command = "echo ${data.tfe_outputs.foo.values}"
 #  }

 #  triggers = {
 #    hack = "${timestamp()}"
 #  }
# }
