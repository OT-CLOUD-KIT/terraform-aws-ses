variable "enable_SES_resource" {
  type        = bool
  description = "enable the SES resource, true or false"
}

variable "domain" {
  type        = string
  description = "Domain to use for SES"
}

variable "iam_name" {
  type        = string
  description = "IAM username"
}

variable "enable_filter" {
  type        = bool
  description = "Control whether or not to enable receipt filter"
}

variable "mail_from_domain" {
  type        = string
  description = "Subdomain (of the route53 zone) which is to be used as MAIL FROM address"
}

variable "zone_id" {
  type        = string
  description = "Route53 host zone ID to enable SES"
}

variable "filter_name" {
  type        = string
  description = "The name of the filter"
}

variable "filter_cidr" {
  type        = string
  description = "The IP address or address range to filter, in CIDR notation"
}

variable "filter_policy" {
  type        = string
  description = "Block or Allow filter"
}

variable "policy_name" {
  type        = string
  description = "Name of the policy"
}

variable "template_name" {
  type        = string
  description = "The name of the template. Cannot exceed 64 characters. You will refer to this name when you send email"
}

variable "template_subject" {
  type        = string
  description = "The subject line of the email"
}

variable "template_html" {
  type        = string
  description = "The HTML body of the email. Must be less than 500KB in size, including both the text and HTML parts"
}

variable "text" {
  type        = string
  description = "The email body that will be visible to recipients whose email clients do not display HTML"
}

variable "txt_type" {
  type        = string
  description = "TXT type for Record Set"
}

variable "mx_type" {
  type        = string
  description = "MX type for Record Set"
}

variable "cname_type" {
  type        = string
  description = "CNAME type for Record Set"
}

variable "ses_records" {
  type        = list(string)
  description = "Additional entries which are added to the _amazonses record"
}

variable "ses_domain_dkim" {
  type        = list(string)
  description = "ses domain dkim"
}

variable "dkim" {
  type        = string
  description = "Domain Keys Identified Mail"
}

variable "ses_domain_mail_from" {
  type        = string
  description = "ses domain mail from"
}

variable "mx_send_mail_from" {
  type        = string
  description = "mx send mail from"
}

variable "document" {
  type        = list(string)
  description = "document"
}

variable "iam_access_key" {
  type        = list(string)
  description = "iam access key"
}

variable "iam_user_policy" {
  type        = list(string)
  description = "iam user policy"
}

variable "ttl" {
  type        = number
  description = "time to live value"
}

variable "ses_name" {
  type        = string
  description = "ses name"
}



