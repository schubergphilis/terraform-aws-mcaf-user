variable "name" {
  type        = string
  description = "The name of the user"
}

variable "force_create_policy" {
  type        = bool
  default     = null
  description = "Overrule whether the role policy has to be created."
}

variable "policy" {
  type        = string
  default     = null
  description = "The policy to attach to the user"
}

variable "policy_arns" {
  type        = set(string)
  default     = []
  description = "A set of policy ARNs to attach to the user"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used to encrypt all data"
}

variable "postfix" {
  type        = bool
  default     = true
  description = "Postfix the user and policy names with Account and Policy"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the user"
}
