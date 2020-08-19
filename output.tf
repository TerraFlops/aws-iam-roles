output "iam_role_arn" {
  description = "The AWS ARN of the newly created role"
  value = aws_iam_role.role.arn
}

output "iam_role_name" {
  description = "The name of the newly created role"
  value = aws_iam_role.role.name
}
