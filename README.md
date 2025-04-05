# Terraform Module Cookiecutter

This CookieCutter Template generates Terraform Modules with all the best practices.

To use this template install [CookieCutter](https://www.cookiecutter.io/) and run this command:

```bash
cookiecutter gh:TerraformInDepth/terraform-module-cookiecutter
```

You will then be asked a few questions, such as what provider you are using, which will be used to generate a customized project.

If your project has custom (but repeated) needs you can always fork this template to add any customizations your team might want.

## Features

* Security Scanning with Checkov and Trivy.
* Quality Control with TFLint.
* Formatting and Validation with Terraform and OpenTofu.
* CI using Github Actions Workflows.
* Git Hooks with the Pre-Commit Framework.
* Terraform and OpenTofu version management with tenv.
* Testing with Terratest and Terraform Testing Framework.

## Terraform in Depth

This template was developed alongside [Terraform in Depth](https://mng.bz/QR21), which was published in February 2025. The version of this template released with the book was tagged [v1.0.0](https://github.com/TerraformInDepth/terraform-module-cookiecutter/tree/v1.0.0), but as an actively maintained project additional changes have been made since then.
