moved {
  from = aws_iam_access_key.default
  to   = aws_iam_access_key.default[0]
}

moved {
  from = aws_ssm_parameter.access_key_id
  to   = aws_ssm_parameter.access_key_id[0]
}

moved {
  from = aws_ssm_parameter.secret_access_key
  to   = aws_ssm_parameter.secret_access_key[0]
}

moved {
  from = aws_ssm_parameter.ses_smtp_password_v4
  to   = aws_ssm_parameter.ses_smtp_password_v4[0]
}
