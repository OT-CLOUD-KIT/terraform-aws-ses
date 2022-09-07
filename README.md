#  Simple Email Service (SES)

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/200x100/https://www.opstree.com/images/og_image8.jpg

* Amazon Simple Email Service is a pay-per-use service that allows you to build in email functionality into an application that you are running on AWS. 
* Using SMTP or a simple API call, this service offers high rate of email deliverability and easy, immediate access to your email-sending statistics.

## Usage


```hcl
module "SES" {   
source               = "./SES"                                                            
domain               = "funzinix.com"
iam_name             = "ses-user"
zone_id              = "Z00042302E0H4BKCCW29"
enable_filter        = false
mail_from_domain     = "mail.funzinix.com"
filter_name          = "block-spammer"
filter_cidr          = "10.10.10.10"
filter_policy        = "Block"
policy_name          = "example"
template_name        = "MyTemplate3"
template_subject     = "Greetings, {{name}}!"
template_html        = "<h1>Hello {{name}},</h1><p>Your favorite animal is {{favoriteanimal}}.</p>"
text                 = "Hello {{name}},\r\nYour favorite animal is {{favoriteanimal}}."
txt_type             = "TXT"
mx_type              = "MX"
cname_type           = "CNAME"
ses_records          = []
ses_domain_dkim      = []
dkim                 = ""
ses_domain_mail_from = ""
mx_send_mail_from    = ""
document             = []
iam_access_key       = []
iam_user_policy      = []
ses_name             = "_amazonses"
ttl                  = 600
}       
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cname\_type | CNAME type for Record Set. | `string` | `"CNAME"` | no |
| domain | Domain to use for SES. | `string` | n/a | yes |
| enable\_filter | Control whether or not to enable receipt filter. | `bool` | `true` | no |
| filter\_cidr | The IP address or address range to filter, in CIDR notation. | `string` |`10.10.10.10"` | no |
| filter\_name | The name of the filter. | `string` | `"block-spammer"` | no |
| filter\_policy | Block or Allow filter. | `string` | `"Block"`| no |
| iam\_name | IAM username. | `string` | `"ses-user"` | no |
| mail\_from\_domain | Subdomain (of the route53 zone) which is to be used as MAIL FROM address. | `string` | `"mail.funzinix.com"`| no |
| mx\_type | MX type for Record Set. | `string` | `"MX"` | no |
| policy\_name | Name of the policy. | `string` | `example"` | no |
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
| template\_html | The HTML body of the email. Must be less than 500KB in size, including both the text and HTML parts. | `string` | `"<h1>Hello {{name}},</h1><p>Your favorite animal is {{favoriteanimal}}.</p>"` | no |
| template\_name | The name of the template. Cannot exceed 64 characters. You will refer to this name when you send email. | `string` | `template_name` | no |
| template\_subject | The subject line of the email. | `string` | `"Greetings, {{name}}!"` | no |
| text | The email body that will be visible to recipients whose email clients do not display HTML. | `string` |`"Hello {{name}},\r\nYour favorite animal is {{favoriteanimal}}."` | no |
| txt\_type | TXT type for Record Set. | `string` | `"TXT"` | no |
| zone\_id | Route53 host zone ID to enable SES. | `string` | n/a | no |


## Note

 if enable_filter value is true make sure you have choosen the aws region(US East (N. Virginia),US West (Oregon),Europe (Ireland)) which support aws_ses_receipt_filter.


## Outputs

These defined outputs that can be used within the same service and terraform release.

| Name | Description |
|------|-------------|
| domain_identity_arn | ARN of the SES domain identity |


## Contributors

![Screenshot from 2022-08-31 11-15-32](https://user-images.githubusercontent.com/98826875/187603118-a9bf0285-01f9-409e-9752-2fec11bc551b.png)


[Shristi Gupta][shristi_homepage]

  [shristi_homepage]: https://gitlab.com/shristi.gupta

  