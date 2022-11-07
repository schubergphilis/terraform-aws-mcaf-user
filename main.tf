locals {
  create_policy        = var.create_policy != null ? var.create_policy : var.policy != null
  groups               = local.create_policy ? setunion(var.groups, [aws_iam_group.default[0].name]) : [aws_iam_group.default[0].name]
  ssm_name             = replace(var.name, "@", "_")
  tfc_agent_accountid  = var.tfc_agent_role_configuration["AccountId"]
  tfc_agent_externalid = var.tfc_agent_role_configuration["ExternalId"]
}

resource "aws_iam_user" "default" {
  count = local.tfc_agent_accountid == null ? 1 : 0
  name  = "${var.name}${var.postfix ? "Account" : ""}"
  tags  = var.tags
}

data "aws_iam_policy" "AdministratorAccess" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role" "tfc_agent_role" {
  count = local.tfc_agent_accountid == null ? 1 : 0
  name  = "s3-role"
  assume_role_policy = templatefile("${path.module}/templates/assume_policy.tpl", {
    aws_account_id = local.tfc_agent_accountid,
    external_id    = local.tfc_agent_externalid
  })
}

resource "aws_iam_role_policy_attachment" "tfc_agent_role_policy" {
  count      = local.tfc_agent_accountid == null ? 1 : 0
  role       = aws_iam_role.tfc_agent_role.*.name
  policy_arn = data.aws_iam_policy.AdministratorAccess.arn
}

resource "aws_iam_access_key" "default" {
  count = local.tfc_agent_accountid == null ? 1 : 0
  user  = aws_iam_user.default.*.name
}

resource "aws_iam_group" "default" {
  count = local.create_policy || length(var.policy_arns) > 0 ? 1 : 0
  name  = "${var.name}${var.postfix ? "Group" : ""}"
}

resource "aws_iam_group_policy" "default" {
  count  = local.create_policy ? 1 : 0
  name   = "${var.name}${var.postfix ? "Policy" : ""}"
  group  = aws_iam_group.default[0].name
  policy = var.policy
}

resource "aws_iam_group_policy_attachment" "default" {
  for_each = var.policy_arns

  group      = aws_iam_group.default[0].name
  policy_arn = each.value
}

resource "aws_iam_user_group_membership" "default" {
  count  = local.tfc_agent_accountid == null ? 1 : 0
  user   = aws_iam_user.default.*.name
  groups = local.groups
}

resource "aws_ssm_parameter" "access_key_id" {
  count  = local.tfc_agent_accountid == null ? 1 : 0
  name   = "/${lower(local.ssm_name)}${var.postfix ? "account" : ""}/credentials/access_key_id"
  type   = "SecureString"
  value  = aws_iam_access_key.default.*.id
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "secret_access_key" {
  count  = local.tfc_agent_accountid == null ? 1 : 0
  name   = "/${lower(local.ssm_name)}${var.postfix ? "account" : ""}/credentials/secret_access_key"
  type   = "SecureString"
  value  = aws_iam_access_key.default.*.secret
  key_id = var.kms_key_id
  tags   = var.tags
}

resource "aws_ssm_parameter" "ses_smtp_password_v4" {
  count  = var.ssm_ses_smtp_password_v4 ? 1 : 0
  name   = "/${lower(local.ssm_name)}${var.postfix ? "account" : ""}/credentials/ses_smtp_password_v4"
  type   = "SecureString"
  value  = aws_iam_access_key.default.*.ses_smtp_password_v4
  key_id = var.kms_key_id
  tags   = var.tags
}
