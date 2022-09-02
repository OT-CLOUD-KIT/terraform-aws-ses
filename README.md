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
  enable_verification     = var.enable_verification
  enable_mail_from        = var.enable_mail_from
  enable_domain           = var.enable_domain
  enable_mx               = var.enable_mx 
  enable_spf_domain       = var.enable_spf_domain
  enable_filter           = var.enable_filter
  enable_policy           = var.enable_policy
  enable_template         = var.enable_template
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
  tags                    = var.tags
}        
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cname\_type | CNAME type for Record Set. | `string` | `"CNAME"` | no |
| domain | Domain to use for SES. | `string` | n/a | yes |
| enable\_domain | Control whether or not to enable domain. | `bool` | `true` | no |
| enable\_filter | Control whether or not to enable receipt filter. | `bool` | `false` | no |
| enable\_mail\_from | Control whether or not to enable mail from domain. | `bool` | `false` | no |
| enable\_mx | Control whether or not to enable mx DNS records. | `bool` | `false` | no |
| enable\_policy | Control whether identity policy create for SES. | `bool` | `false` | no |
| enable\_spf\_domain | Control whether or not to enable enable spf domain. | `bool` | `false` | no |
| enable\_template | Control whether create a template for emails. | `bool` | `false` | no |
| enable\_verification | Control whether or not to verify SES DNS records. | `bool` | `false` | no |
| filter\_cidr | The IP address or address range to filter, in CIDR notation. | `string` | n/a | no |
| filter\_name | The name of the filter. | `string` | n/a | no |
| filter\_policy | Block or Allow filter. | `string` | n/a | no |
| iam\_name | IAM username. | `string` | n/a | no |
| mail\_from\_domain | Subdomain (of the route53 zone) which is to be used as MAIL FROM address. | `string` | n/a | no |
| mx\_type | MX type for Record Set. | `string` | `"MX"` | no |
| policy\_name | Name of the policy. | `string` | n/a | no |
| ses\_records | Additional entries which are added to the \_amazonses record. | `list(string)` | `[]` | no |
| ses_domain_dkim | SES domain DKIM generation resource | `list(string)` | `[]` | no |
| dkim | Domain Keys Identified Mail | `string` | n/a | no |
| ses_domain_mail_from | Domain Mail From in Amazon SES can be configured in Terraform | `string` | n/a | no |
| mx_send_mail_from| MX-record in order to receive email | `string` | n/a | no |
| document |document | `string` | n/a | no || `list(string)` | `[]` | no |
| iam_access_key | iam access key | `list(string)` | `[]` | no |
| ses_name | ses name|`string` | n/a | no |
|iam_user_policy | iam user policy| `list(string)` | `[]` | yes |
| ttl | time to live |`number`| `600` | yes |
| template\_html | The HTML body of the email. Must be less than 500KB in size, including both the text and HTML parts. | `string` | n/a | no |
| template\_name | The name of the template. Cannot exceed 64 characters. You will refer to this name when you send email. | `string` | n/a | no |
| template\_subject | The subject line of the email. | `string` | n/a | no |
| text | The email body that will be visible to recipients whose email clients do not display HTML. | `string` | n/a | no |
| txt\_type | TXT type for Record Set. | `string` | `"TXT"` | no |
| zone\_id | Route53 host zone ID to enable SES. | `string` | n/a | no |


## Outputs

These defined outputs that can be used within the same service and terraform release.

| Name | Description |
|------|-------------|
| domain_identity_arn | ARN of the SES domain identity |


## Contributors

![Screenshot from 2022-08-31 11-15-32](https://user-images.githubusercontent.com/98826875/187603118-a9bf0285-01f9-409e-9752-2fec11bc551b.png)


[Shristi Gupta][shristi_homepage]

  [shristi_homepage]: https://gitlab.com/shristi.gupta

  