locals {
  create_policy = var.create_policy != null ? var.create_policy : var.policy != null
}

resource "aws_iam_user" "default" {
  name = "${var.name}${var.postfix ? "User" : ""}"
  tags = var.tags
}

resource "aws_iam_access_key" "default" {
  user = aws_iam_user.default.name
}

resource "aws_iam_user_policy" "default" {
  count  = local.create_policy ? 1 : 0
  name   = "${var.name}${var.postfix ? "Policy" : ""}"
  user   = aws_iam_user.default.name
  policy = var.policy
}

resource "aws_iam_user_policy_attachment" "default" {
  for_each = var.policy_arns

  user       = aws_iam_user.default.name
  policy_arn = each.value
}

resource "aws_ssm_parameter" "access_key_id" {
  name   = "/${lower(var.name)}account/credentials/access_key_id"
  type   = "SecureString"
  value  = aws_iam_access_key.default.id
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "secret_access_key" {
  name   = "/${lower(var.name)}account/credentials/secret_access_key"
  type   = "SecureString"
  value  = aws_iam_access_key.default.secret
  key_id = var.kms_key_id
  tags   = var.tags
}
