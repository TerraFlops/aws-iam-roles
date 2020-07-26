output "iam_roles" {
  value = aws_iam_role.iam_roles
}

output "iam_role_arns" {
  value = tomap({
    for role in var.roles: role["name"] => aws_iam_role.iam_roles[role["name"]].arn
  })
}

output "iam_role_names" {
  value = tomap({
    for role in var.roles: role["name"] => aws_iam_role.iam_roles[role["name"]].name
  })
}