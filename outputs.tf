output "ssm_access_key_id" {
  value       = aws_ssm_parameter.access_key_id.name
  description = "The SSM access key ID parameter name"
}

output "ssm_secret_access_key" {
  value       = aws_ssm_parameter.secret_access_key.name
  description = "The SSM secret access key parameter name"
}
