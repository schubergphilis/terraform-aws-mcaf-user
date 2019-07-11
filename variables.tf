variable "name" {
  type        = string
  description = "The name of the user"
}

variable "policy" {
  type        = string
  description = "The policy to attach to the user"
}

variable "kms_key_id" {
  type        = string
  description = "The KMS key ID used to encrypt all data"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SSM Parameter"
}
