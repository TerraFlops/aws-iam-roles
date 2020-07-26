# Create IAM roles
resource "aws_iam_role" "iam_roles" {
  for_each = tomap({
    for role in var.roles: role["name"] => role
  })
  name = each.value["name"]
  description = each.value["description"]
  assume_role_policy = each.value["assume_role_policy_document"]
  force_detach_policies = true
}

# Attach policies to roles
resource "aws_iam_role_policy" "iam_role_policies" {
  depends_on = [
    aws_iam_role.iam_roles
  ]

  for_each = tomap({
    for policy in var.policies: "${policy["role_name"]}${policy["name"]}" => policy
  })

  name = each.value.name
  role = aws_iam_role.iam_roles[each.value.role_name].name
  policy = each.value.document
}
