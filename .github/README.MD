# Terraflops Terraform Module
 
### AWS IAM Role

This module creates an AWS IAM role and links it with one or more policies (either standalone or inline policies).

#### Example usage

```hcl-terraform
module "example_iam_role" {
  source = "git::https://github.com/TerraFlops/aws-iam-role.git?ref=v2.0"
  name = "ExampleIamRole" 
  description = "This is an example of creating an IAM role"
  # Create an inline IAM policy on this role
  inline_policies = [
    {
      name = "SecretsManagerReadPassword"
      policy_document = data.aws_iam_policy_document.secrets_manager_read_password.json
    }
  ]
  # Create standalone IAM policy resource and link to this newly created role
  policies = [
    {
      name = "S3BucketRead"
      policy_document = data.aws_iam_policy_document.s3_bucket_read.json
    }
  ]
}
```
