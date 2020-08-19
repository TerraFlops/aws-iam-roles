variable "name" {
  description = "Name of the IAM role to be created"
  type = string
}

variable "description" {
  description = "Description of the IAM role"
  type = string
}

variable "assume_role_policy" {
  description = "Optional assume policy role (JSON) to attach to the IAM role"
  type = string
  default = null
}

variable "policies" {
  description = "List of standalone IAM policy resources to create and attach to the IAM role"
  type = list(object({
    name = string
    policy_document = string
  }))
}

variable "inline_policies" {
  description = "List of inline IAM policies to create and attach to the IAM role"
  type = list(object({
    name = string
    policy_document = string
  }))
}