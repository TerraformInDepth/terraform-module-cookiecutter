plugin "terraform" {
  enabled = true
  preset  = "all"
}

plugin "opa" {
  enabled = false
  version = "0.7.0"
  source  = "github.com/terraform-linters/tflint-ruleset-opa"
}

{% if cookiecutter.__short_primary_provider == "aws" %}
plugin "aws" {
    enabled = true
    version = "0.38.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
{% endif %}

{% if cookiecutter.__short_primary_provider == "gcp" %}
plugin "google" {
    enabled = true
    version = "0.31.0"
    source  = "github.com/terraform-linters/tflint-ruleset-google"
}
{% endif %}

{% if cookiecutter.__short_primary_provider == "azurerm" %}
plugin "azurerm" {
    enabled = true
    version = "0.28.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
{% endif %}


