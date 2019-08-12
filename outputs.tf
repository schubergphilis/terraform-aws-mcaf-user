output "name" {
  value       = aws_iam_user.default.name
  description = "The user name"
}

output "arn" {
  value       = aws_iam_user.default.arn
  description = "The user ARN"
}

output "access_key_id" {
  value       = aws_iam_access_key.default.id
  description = "The access key ID"
}

output "secret_access_key" {
  value       = aws_iam_access_key.default.secret
  description = "The secret access key"
}

output "ssm_access_key_id" {
  value       = aws_ssm_parameter.access_key_id[0].name
  description = "The SSM access key ID parameter name"
}

output "ssm_secret_access_key" {
  value       = aws_ssm_parameter.secret_access_key[0].name
  description = "The SSM secret access key parameter name"
}
