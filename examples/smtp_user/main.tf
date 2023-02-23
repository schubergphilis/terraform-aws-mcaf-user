provider "aws" {}

resource "aws_ses_domain_identity" "example" {
  domain = "example.com"
}

data "aws_iam_policy_document" "allow_iam_user_to_send_emails" {
  statement {
    actions   = ["ses:SendRawEmail"]
    resources = [aws_ses_domain_identity.example.arn]
  }
}

module "smtp_user" {
  source                   = "../../"
  name                     = "SmtpUser"
  policy                   = data.aws_iam_policy_document.allow_iam_user_to_send_emails.json
  postfix                  = false
  ssm_ses_smtp_password_v4 = true

  tags = {
    env = "production"
  }
}
