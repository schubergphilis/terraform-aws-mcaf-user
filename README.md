# terraform-aws-mcaf-user

Terraform module to create an IAM user. Suitable for e.g. CI/CD systems or systems which are external to AWS that cannot leverage AWS IAM Roles, AWS IAM Instance Profiles or AWS OIDC.

It's not recommended creating IAM users this way for any other purpose.

It is recommended that IAM policies be applied directly to groups and roles but not users. This module by default attaches the IAM policy to an IAM group with the same name instead of directly to the user.

If an AWS Access Key is created, it is stored in the SSM Parameter Store and is provided as a module output.

## Usage

IMPORTANT: We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

## Licensing

100% Open Source and licensed under the Apache License Version 2.0.

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->

## Using Pre-commit

To make local development easier, we have added a pre-commit configuration to the repo. to use it, follow these steps:

Install the following tools:

```brew install tflint```

Install pre-commit:

```pip3 install pre-commit --upgrade```

To run the pre-commit hooks to see if everything working as expected, (the first time run might take a few minutes):

```pre-commit run -a```

To install the pre-commit hooks to run before each commit:

```pre-commit install```

## Release Drafter

1. Every time a PR is merged, the draft release note is updated to add a entry for this change.

2. The release version is incremented if this is the first PR for a new release. Note: This will only update the draft release note.

3. When ready to publish the release, we use the drafted release note to do so.

## PR Convention

Release drafter categorizes the changes in the release into Features, Bug Fixes, Documentation and Other Changes categories as per the labels added to the PR. Add one or multiple of the following labels to the PR:

- `breaking`, `enhancement`, `feature`, `bug`, `fix`, `security`, `documentation`)

- We require pull request titles to follow the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/)
