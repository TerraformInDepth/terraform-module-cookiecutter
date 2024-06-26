package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	// Allow the TerraformBinary option to be changed by users.
	// This makes it possible to switch to tofu easily.
	terraformBinary := os.Getenv("TERRATEST_BINARY")
	if len(terraformBinary) <= 0 {
		terraformBinary = "terraform"
	}

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// Point this at the specific module or example to test.
		TerraformDir: "../examples/basic",

		// Switch between Terraform binaries.
		TerraformBinary: terraformBinary,

		Vars: map[string]interface{}{
			// Input Variables go here.
			// "test_input": testInput,
		},
	})

	// Run terraform destroy after all other test code has run, even with errors.
	defer terraform.Destroy(t, terraformOptions)

	// Run terraform apply immediately.
	terraform.InitAndApply(t, terraformOptions)

	// Get any outputs from Terraform.
	// testOutput := terraform.Output(t, terraformOptions, "test_output")

	// Run assertions to conform that outputs are what you expect.
	//assert.Equal(t, testInput, testOutput)
}
