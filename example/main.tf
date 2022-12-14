module "SES" {
  source               = "git::https://github.com/OT-CLOUD-KIT/terraform-aws-ses.git"
  count                = var.enable_SES_resource ? 1 : 0
  domain               = var.domain
  iam_name             = var.iam_name
  zone_id              = var.zone_id
  enable_filter        = var.enable_filter
  mail_from_domain     = var.mail_from_domain
  filter_name          = var.filter_name
  filter_cidr          = var.filter_cidr
  filter_policy        = var.filter_policy
  policy_name          = var.policy_name
  template_name        = var.template_name
  template_subject     = var.template_subject
  template_html        = var.template_html
  text                 = var.text
  txt_type             = var.txt_type
  mx_type              = var.mx_type
  cname_type           = var.cname_type
  ses_records          = var.ses_records
  ses_domain_dkim      = var.ses_domain_dkim
  dkim                 = var.dkim
  ses_domain_mail_from = var.ses_domain_mail_from
  mx_send_mail_from    = var.mx_send_mail_from
  document             = var.document
  iam_access_key       = var.iam_access_key
  ses_name             = var.ses_name
  iam_user_policy      = var.iam_user_policy
  ttl                  = var.ttl
}
