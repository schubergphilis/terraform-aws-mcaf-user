provider "aws" {}

resource "aws_iam_user" "default" {
  count = var.create_user ? 1 : 0
  name  = "${var.name}${var.postfix ? "Account" : ""}"
  tags  = var.tags
}

resource "aws_iam_access_key" "default" {
  count = var.create_user ? 1 : 0
  user  = aws_iam_user.default.0.name
}

resource "aws_iam_user_policy" "default" {
  count  = (var.create_user && var.policy != null) ? 1 : 0
  name   = "${var.name}${var.postfix ? "Policy" : ""}"
  user   = aws_iam_user.default.0.name
  policy = var.policy
}

resource "aws_iam_user_policy_attachment" "default" {
  for_each = var.policy_arns

  user       = aws_iam_user.default.0.name
  policy_arn = each.value
}

resource "aws_ssm_parameter" "access_key_id" {
  count  = var.create_user ? 1 : 0
  name   = "/${lower(var.name)}account/credentials/access_key_id"
  type   = "SecureString"
  value  = aws_iam_access_key.default.0.id
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "secret_access_key" {
  count  = var.create_user ? 1 : 0
  name   = "/${lower(var.name)}account/credentials/secret_access_key"
  type   = "SecureString"
  value  = aws_iam_access_key.default.0.secret
  key_id = var.kms_key_id
  tags   = var.tags
}
