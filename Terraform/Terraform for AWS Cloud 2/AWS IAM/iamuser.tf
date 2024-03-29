#TF file for IAM Users and groups
resource "aws_iam_user" "adminuser1" {
  name = "adminuser1"
}
resource "aws_iam_user" "adminuser2" {
  name = "adminuser2"
}

#Group TF Definination
resource "aws_iam_group" "admingroup" {
  name = "admingroup"
}

#Assign Uses to Aws Group
resource "aws_iam_group_membership" "admin-users" {
  name = "admin-users"
  users = [
    aws_iam_user.adminuser1.name,
    aws_iam_user.adminuser2.name
  ]
  group = aws_iam_group.admingroup.name
}

#Define the Policy on the Groups
resource "aws_iam_policy_attachment" "admin-users-attach" {
  name = "admin-users-attach"
  groups = [ aws_iam_group.admingroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}