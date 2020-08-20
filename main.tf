# Create iterable maps of the supplied policies variables
locals {
  policies = tomap({
    for policy in var.policies: policy["name"] => policy["policy_document"]
  })
  inline_policies = tomap({
    for policy in var.inline_policies: policy["name"] => policy["policy_document"]
  })
}

# Create IAM role
resource "aws_iam_role" "role" {
  name = var.name
  description = var.description
  assume_role_policy = var.assume_role_policy
  force_detach_policies = true
}

# Create inline policies attached to the role
resource "aws_iam_role_policy" "inline_policies" {
  for_each = local.inline_policies
  role = aws_iam_role.role.name
  name = each.key
  policy = each.value
}

# Create standalone policy objects
resource "aws_iam_policy" "policies" {
  for_each = local.policies
  policy = each.value
  name = each.key
}

# Attach stand-alone policies to the role
resource "aws_iam_role_policy_attachment" "policies" {
  for_each = local.policies
  policy_arn = aws_iam_policy.policies[each.key].arn
  role = aws_iam_role.role.name
}