output "domain_identity_arn" {
  value       = join("", aws_ses_domain_identity.ses_domain_identity.*.arn)
  description = "ARN of the SES domain identity."
}