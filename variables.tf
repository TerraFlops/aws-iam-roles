variable "roles" {
  type = list(object({
    name = string
    description = string
    assume_role_policy_document = string
  }))
}

variable "policies" {
  type = list(object({
    name = string
    role_name = string
    document = string
  }))
}