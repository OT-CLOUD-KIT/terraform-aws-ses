locals {
  stripped_domain_name      = replace(var.domain, "/[.]$/", "")
  stripped_mail_from_domain = replace(var.mail_from_domain, "/[.]$/", "")
  dash_domain               = replace(var.domain, ".", "-")
}

resource "aws_ses_domain_identity" "ses_domain_identity" {
  domain = var.domain
}

resource "aws_ses_domain_identity_verification" "ses_domain_identity_verification" {
  domain     = aws_ses_domain_identity.ses_domain_identity.id
  depends_on = [aws_route53_record.ses_verification]
}

resource "aws_route53_record" "ses_verification" {
  zone_id = var.zone_id
  name    = var.ses_name
  type    = var.txt_type
  ttl     = var.ttl
  records = [aws_ses_domain_identity.ses_domain_identity.verification_token]
}

resource "aws_ses_domain_dkim" "ses_domain_dkim" {
  domain = aws_ses_domain_identity.ses_domain_identity.domain
}

resource "aws_route53_record" "dkim" {
  count   = 3
  zone_id = var.zone_id
  name    = format("%s._domainkey.%s", element(aws_ses_domain_dkim.ses_domain_dkim.dkim_tokens, count.index), var.domain)
  type    = var.cname_type
  ttl     = var.ttl
  records = [format("%s.dkim.amazonses.com", element(aws_ses_domain_dkim.ses_domain_dkim.dkim_tokens, count.index))]
}

resource "aws_ses_domain_mail_from" "ses_domain_mail_from" {
  domain           = aws_ses_domain_identity.ses_domain_identity.domain
  mail_from_domain = local.stripped_mail_from_domain
}

resource "aws_route53_record" "spf_mail_from" {
  zone_id = var.zone_id
  name    = aws_ses_domain_mail_from.ses_domain_mail_from.mail_from_domain
  type    = var.txt_type
  ttl     = var.ttl
  records = ["v=spf1 include:amazonses.com -all"]
}

resource "aws_route53_record" "mx_send_mail_from" {
  zone_id = var.zone_id
  name    = aws_ses_domain_mail_from.ses_domain_mail_from.mail_from_domain
  type    = var.mx_type
  ttl     = var.ttl
  records = [format("10 feedback-smtp.%s.amazonses.com", data.aws_region.current.name)]
}

data "aws_region" "current" {}

resource "aws_ses_receipt_filter" "ses_receipt_filter" {
  count  = var.enable_filter ? 1 : 0
  name   = var.filter_name
  cidr   = var.filter_cidr
  policy = var.filter_policy
}

data "aws_iam_policy_document" "document" {
  statement {
    actions   = ["SES:SendEmail", "SES:SendRawEmail"]
    resources = [aws_ses_domain_identity.ses_domain_identity.arn]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

resource "aws_ses_identity_policy" "ses_identity_policy" {
  identity = aws_ses_domain_identity.ses_domain_identity.arn
  name     = var.policy_name
  policy   = data.aws_iam_policy_document.document.json
}

resource "aws_ses_template" "ses_template" {
  name    = var.template_name
  subject = var.template_subject
  html    = var.template_html
  text    = var.text
}

resource "aws_iam_user" "iam_user" {
  name = var.iam_name
}

resource "aws_iam_access_key" "iam_access_key" {
  user = join("", aws_iam_user.iam_user.*.name)
}

resource "aws_iam_user_policy" "iam_user_policy" {
  name   = var.iam_name
  user   = join("", aws_iam_user.iam_user.*.name)
  policy = data.aws_iam_policy_document.allow_iam_name_to_send_emails.json
}

data "aws_iam_policy_document" "allow_iam_name_to_send_emails" {
  statement {
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}
