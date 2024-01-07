// ec2_instance_test.go
package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/aws"
  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestTerraformEC2Instance(t *testing.T) {
  terraformOptions := &terraform.Options{
    // Set the path to the Terraform code that will be tested.
    TerraformDir: "../ec2-instance",
  }

  // Clean up resources after test execution.
  defer terraform.Destroy(t, terraformOptions)

  // Deploy the Terraform code.
  terraform.InitAndApply(t, terraformOptions)

  // Get the ID of the EC2 instance.
  instanceID := terraform.Output(t, terraformOptions, "example_instance_id")

  // Verify that the EC2 instance exists.
  ec2Instance := aws.GetEc2Instance(t, instanceID, "us-west-2")
  assert.Equal(t, "t2.micro", *ec2Instance.InstanceType)
}