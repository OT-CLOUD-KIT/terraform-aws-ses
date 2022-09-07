#  Simple Email Service (SES)

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/200x100/https://www.opstree.com/images/og_image8.jpg

* Amazon Simple Email Service is a pay-per-use service that allows you to build in email functionality into an application that you are running on AWS. 
* Using SMTP or a simple API call, this service offers high rate of email deliverability and easy, immediate access to your email-sending statistics.

## Usage


```hcl
module "SES" {
  source                  = "git::https://github.com/OT-CLOUD-KIT/terraform-aws-ses.git"
  count                   = var.enable_SES_resource == true ? 1 : 0
  domain                  = var.domain
  iam_name                = var.iam_name
  zone_id                 = var.zone_id
  enable_filter           = var.enable_filter
  mail_from_domain        = var.mail_from_domain
  filter_name             = var.filter_name
  filter_cidr             = var.filter_cidr
  filter_policy           = var.filter_policy
  policy_name             = var.policy_name
  template_name           = var.template_name
  template_subject        = var.template_subject
  template_html           = var.template_html
  text                    = var.text
  txt_type                = var.txt_type
  mx_type                 = var.mx_type
  cname_type              = var.cname_type
  ses_records             = var.ses_records
  ses_domain_dkim         = var.ses_domain_dkim
  dkim                    = var.dkim
  ses_domain_mail_from    = var.ses_domain_mail_from
  mx_send_mail_from       = var.mx_send_mail_from
  document                = var.document
  iam_access_key          = var.iam_access_key
  ses_name                = var.ses_name
  iam_user_policy         = var.iam_user_policy
  ttl                     = var.ttl
}       
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cname_type | CNAME type for Record Set. | `string` | `"CNAME"` | no |
| domain | Domain to use for SES. | `string` | `"opstree.com"` | yes |
| enable_filter | Control whether or not to enable receipt filter. | `bool` | `true` | no |
| zone_id | route53 hosted zone id in the form of a string| `string` | `""` | yes |
| filter_cidr | The IP address or address range to filter, in CIDR notation. | `string` |`10.10.10.10"` | no |
| filter_name | The name of the filter. | `string` | `"block-spammer"` | no |
| filter_policy | Block or Allow filter. | `string` | `"Block"`| no |
| iam_name | IAM username. | `string` | `"ses-user"` | yes |
| mail_from_domain | Subdomain (of the route53 zone) which is to be used as MAIL FROM address. | `string` | `"mail.opstree.com"`| no |
| mx_type | MX type for Record Set. | `string` | `"MX"` | no |
| policy_name | Name of the policy. | `string` | `example"` | no |
| ses_records | Additional entries which are added to the \_amazonses record. | `list(string)` | `[]` | no |
| ses_domain_dkim | SES domain DKIM generation resource | `list(string)` | `[]` | no |
| dkim | Domain Keys Identified Mail | `string` | n/a | no |
| ses_domain_mail_from | Domain Mail From in Amazon SES can be configured in Terraform | `string` | n/a | no |
| mx_send_mail_from| MX-record in order to receive email | `string` | n/a | no |
| document |document | `string` | n/a | no || `list(string)` | `[]` | no |
| iam_access_key | iam access key | `list(string)` | `[]` | no |
| ses_name | ses name|`string` | n/a | no |
|iam_user_policy | iam user policy| `list(string)` | `[]` | yes |
| ttl | time to live |`number`| `600` | yes |
| template_html | The HTML body of the email. Must be less than 500KB in size, including both the text and HTML parts. | `string` | `"<h1>Hello {{name}},</h1><p>Your favorite animal is {{favoriteanimal}}.</p>"` | no |
| template_name | The name of the template. Cannot exceed 64 characters. You will refer to this name when you send email. | `string` | `template_name` | no |
| template_subject | The subject line of the email. | `string` | `"Greetings, {{name}}!"` | no |
| text | The email body that will be visible to recipients whose email clients do not display HTML. | `string` |`"Hello {{name}},\r\nYour favorite animal is {{favoriteanimal}}."` | no |
| txt_type | TXT type for Record Set. | `string` | `"TXT"` | no |



## Note

 if enable_filter value is true make sure you have choosen the aws region (US East (N. Virginia), US West (Oregon), Europe (Ireland)) which support aws_ses_receipt_filter.


## Outputs

These defined outputs that can be used within the same service and terraform release.

| Name | Description |
|------|-------------|
| domain_identity_arn | ARN of the SES domain identity |


## Contributors

![Screenshot from 2022-08-31 11-15-32](https://user-images.githubusercontent.com/98826875/187603118-a9bf0285-01f9-409e-9752-2fec11bc551b.png)


[Shristi Gupta][shristi_homepage]

  [shristi_homepage]: https://gitlab.com/shristi.gupta

  