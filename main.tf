resource aws_iam_user default {
  name = "${var.name}Account"
}

resource aws_iam_access_key default {
  user = aws_iam_user.default.name
}

resource aws_iam_user_policy default {
  name   = "${var.name}Policy"
  user   = aws_iam_user.default.name
  policy = var.policy
}

resource aws_ssm_parameter access_key_id {
  count  = var.use_ssm ? 1 : 0
  name   = "/${lower(var.name)}account/credentials/access_key_id"
  type   = "SecureString"
  value  = aws_iam_access_key.default.id
  key_id = var.kms_key_id
}

resource aws_ssm_parameter secret_access_key {
  count  = var.use_ssm ? 1 : 0
  name   = "/${lower(var.name)}account/credentials/secret_access_key"
  type   = "SecureString"
  value  = aws_iam_access_key.default.secret
  key_id = var.kms_key_id
  tags   = var.tags
}
