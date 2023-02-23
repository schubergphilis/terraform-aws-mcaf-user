# terraform-aws-mcaf-user

Terraform module to create an IAM user. Suitable for e.g. CI/CD Systems or systems which are external to AWS that cannot leverage AWS IAM Instance Profiles or AWS OIDC.

It's not recommended creating IAM users this way for any other purpose.

It is recommended that IAM policies be applied directly to groups and roles but not users. This module by default attaches the IAM policy to an IAM group with the same name instead of directly to the user.

If an AWS Access Key is created, it is stored in the SSM Parameter Store and is provided as a module output.

## Usage

IMPORTANT: We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

## Licensing

100% Open Source and licensed under the Apache License Version 2.0.

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->
