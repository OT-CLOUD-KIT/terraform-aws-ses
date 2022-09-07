variable "domain" {
  type        = string
  default     = ""
  description = "Domain to use for SES"
}

variable "iam_name" {
  type        = string
  default     = "ses-user"
  description = "IAM username"
}

variable "mail_from_domain" {
  type        = string
  default     = ""
  description = "Subdomain (of the route53 zone) which is to be used as MAIL FROM address"
}

variable "zone_id" {
  type        = string
  default     = ""
  description = "Route53 host zone ID to enable SES"
}

variable "enable_filter" {
  type        = bool
  default     = false
  description = "Control whether or not to enable receipt filter"
}

variable "filter_name" {
  type        = string
  default     = "block-spammer"
  description = "The name of the filter"
}

variable "filter_cidr" {
  type        = string
  default     = "10.10.10.10"
  description = "The IP address or address range to filter, in CIDR notation"
}

variable "filter_policy" {
  type        = string
  default     = "Block"
  description = "Block or Allow filter"
}

variable "policy_name" {
  type        = string
  default     = "example"
  description = "Name of the policy"
}

variable "template_name" {
  type        = string
  default     = "MyTemplate4"
  description = "The name of the template. Cannot exceed 64 characters. You will refer to this name when you send email"
}

variable "template_subject" {
  type        = string
  default     = "Greetings, {{name}}!"
  description = "The subject line of the email"
}

variable "template_html" {
  type        = string
  default     = "<h1>Hello {{name}},</h1><p>Your favorite animal is {{favoriteanimal}}.</p>"
  description = "The HTML body of the email. Must be less than 500KB in size, including both the text and HTML parts"
}

variable "text" {
  type        = string
  default     = "Hello {{name}},\r\nYour favorite animal is {{favoriteanimal}}."
  description = "The email body that will be visible to recipients whose email clients do not display HTML"
}

variable "txt_type" {
  type        = string
  default     = "TXT"
  description = "TXT type for Record Set"
}

variable "mx_type" {
  type        = string
  default     = "MX"
  description = "MX type for Record Set"
}

variable "cname_type" {
  type        = string
  default     = "CNAME"
  description = "CNAME type for Record Set"
}

variable "ses_records" {
  type        = list(string)
  default     = []
  description = "Additional entries which are added to the _amazonses record"
}

variable "ses_domain_dkim" {
  type        = list(string)
  default     = []
  description = "ses domain dkim"
}

variable "dkim" {
  type        = string
  default     = ""
  description = "Domain Keys Identified Mail"
}

variable "ses_domain_mail_from" {
  type        = string
  default     = ""
  description = "ses domain mail from"
}

variable "mx_send_mail_from" {
  type        = string
  default     = ""
  description = "mx send mail from"
}

variable "document" {
  type        = list(string)
  default     = []
  description = "document"
}

variable "iam_access_key" {
  type        = list(string)
  default     = []
  description = "iam access key"
}

variable "ses_name" {
  type        = string
  default     = "_amazonses"
  description = "ses name"
}

variable "iam_user_policy" {
  type        = list(string)
  default     = []
  description = "iam user policy"
}

variable "ttl" {
  type        = number
  default     = 600
  description = "time to live value"
}

