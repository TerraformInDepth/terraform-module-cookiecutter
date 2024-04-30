terraform {
  required_providers {
    {{cookiecutter.__short_primary_provider}} = {
      source  = "{{cookiecutter.primary_provider}}"
      version = "~> {{cookiecutter.provider_min_version}}"
    }
  }
  required_version = "~> {{cookiecutter.minimum_terraform_version}}"
}

