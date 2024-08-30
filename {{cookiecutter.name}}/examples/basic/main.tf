terraform {
  required_providers {
    {{cookiecutter.__short_primary_provider}} = {
      source  = "{{cookiecutter.primary_provider}}"
      version = "~> {{cookiecutter.provider_min_version}}"
    }
  }
  required_version = "~> {{cookiecutter.minimum_terraform_version}}"
}

# Replace these variables with the ones for your tests.
variable "test_input" {
  type    = string
  default = "test"
}

# Pass in any variables that the module requires.
# If your module has a `name` field don't forget to add some randomness.
module "basic_example" {
  source = "../../"
  input = var.test_input
}

# Replace this output with the one for your tests.
output "test_output" {
  value = module.basic_example.output
}
