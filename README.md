# terraform-aws-mcaf-user

Terraform module to create an IAM user. Suitable for e.g. CI/CD systems or systems which are external to AWS that cannot leverage AWS IAM Roles, AWS IAM Instance Profiles or AWS OIDC.

It is NOT recommended creating IAM users this way for any other purpose.

It is recommended that IAM policies be applied directly to groups and roles but not users. This module by default attaches the IAM policy to an IAM group with the same name instead of directly to the user.

If an AWS Access Key is created, it is stored in the SSM Parameter Store and is provided as a module output.

IMPORTANT: We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy) | resource |
| [aws_iam_group_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_user.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_ssm_parameter.access_key_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.secret_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.ses_smtp_password_v4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the user. | `string` | n/a | yes |
| <a name="input_create_iam_access_key"></a> [create\_iam\_access\_key](#input\_create\_iam\_access\_key) | Overrule whether the user IAM access keys have to be created | `bool` | `true` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Overrule whether the user role policy has to be created. | `bool` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Destroy the user even if it has non-terraform-managed IAM access keys, login profile or MFA devices | `bool` | `false` | no |
| <a name="input_groups"></a> [groups](#input\_groups) | Set of group names to attach to the user. | `set(string)` | `[]` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The KMS key ID used to encrypt the SSM parameters. | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | Path in which to create the user. | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the user. | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The policy to attach to the user. | `string` | `null` | no |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | A set of policy ARNs to attach to the user. | `set(string)` | `[]` | no |
| <a name="input_postfix"></a> [postfix](#input\_postfix) | Postfix the user, policy and group names with Account, Policy and Group. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where resources will be created; if omitted the default provider region is used | `string` | `null` | no |
| <a name="input_ssm_ses_smtp_password_v4"></a> [ssm\_ses\_smtp\_password\_v4](#input\_ssm\_ses\_smtp\_password\_v4) | Store the user's SES SMTP password in the SSM Parameter Store. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the user. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key_id"></a> [access\_key\_id](#output\_access\_key\_id) | The access key ID |
| <a name="output_arn"></a> [arn](#output\_arn) | The user ARN |
| <a name="output_name"></a> [name](#output\_name) | The user name |
| <a name="output_secret_access_key"></a> [secret\_access\_key](#output\_secret\_access\_key) | The secret access key |
| <a name="output_ses_smtp_password_v4"></a> [ses\_smtp\_password\_v4](#output\_ses\_smtp\_password\_v4) | The SES SMTP password |
| <a name="output_ssm_access_key_id"></a> [ssm\_access\_key\_id](#output\_ssm\_access\_key\_id) | The SSM access key ID parameter name |
| <a name="output_ssm_secret_access_key"></a> [ssm\_secret\_access\_key](#output\_ssm\_secret\_access\_key) | The SSM secret access key parameter name |
| <a name="output_ssm_ses_smtp_password_v4"></a> [ssm\_ses\_smtp\_password\_v4](#output\_ssm\_ses\_smtp\_password\_v4) | The SSM SES SMTP password parameter name |
<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0. See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-user/blob/master/LICENSE) for full details.
