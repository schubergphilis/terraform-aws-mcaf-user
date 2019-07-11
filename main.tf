resource "aws_iam_user" "default" {
  name = "${var.name}Account"
}

resource "aws_iam_access_key" "default" {
  user = "${aws_iam_user.default.name}"
}

resource "aws_iam_user_policy" "default" {
  name   = "${var.name}Policy"
  user   = "${aws_iam_user.default.name}"
  policy = var.policy
}
