resource "aws_ssm_parameter" "https_acm_certificate" {
  name  = "/${var.project_name}/${var.environment}/https_acm_certificate"
  type  = "String"
  value = aws_acm_certificate.expense.arn
}