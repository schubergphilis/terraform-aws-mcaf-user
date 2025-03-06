provider "aws" {}

data "aws_iam_policy_document" "deny" {
  statement {
    sid    = "DenyAll"
    effect = "Deny"

    actions   = ["*"]
    resources = ["*"]
  }
}

module "iam_user" {
  source = "../../"

  name                 = "username"
  policy               = data.aws_iam_policy_document.deny.json
  permissions_boundary = "arn:aws:iam::111111111111:policy/boundary"

  tags = {
    env = "production"
  }
}
