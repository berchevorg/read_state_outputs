resource "random_pet" "name" {
 length    = "9"
 separator = "-"
}



data "terraform_remote_state" "workspace-output" {
  backend = "remote"

  config = {
    organization = "georgiman-tfc4b"
    workspaces = {
      name = "outputs"
    }
  }
}

output "consume_sensitive_value" {
  value = data.terraform_remote_state.workspace-output.outputs.random_pet_name
}
