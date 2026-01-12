provider "aws" {
  region = var.aws_region

  assume_role {
    # ARN of the IAM role you created
    role_arn     = "arn:aws:iam::982534376194:role/terraform-prod-role"
    session_name = "terraform-prod-session"
  }
}
