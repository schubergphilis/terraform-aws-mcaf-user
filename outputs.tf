output "arn" {
  value       = aws_iam_user.default.0.arn
  description = "The user ARN"
}

output "name" {
  value       = aws_iam_user.default.0.name
  description = "The user name"
}

output "access_key_id" {
  value       = aws_iam_access_key.default.0.id
  description = "The access key ID"
}

output "secret_access_key" {
  value       = aws_iam_access_key.default.0.secret
  description = "The secret access key"
}

output "ssm_access_key_id" {
  value       = aws_ssm_parameter.access_key_id.0.name
  description = "The SSM access key ID parameter name"
}

output "ssm_secret_access_key" {
  value       = aws_ssm_parameter.secret_access_key.0.name
  description = "The SSM secret access key parameter name"
}
