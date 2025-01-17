variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {

  default = {
    Terraform   = "true"
    Project     = "expense"
    Environment = "dev"
  }

}

variable "zone_name" {
    default = "aws-devops81s.online"
}

variable "web_alb_tags" {
  default = {
    Component = "web-alb"
  }
}