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

variable "backend_tags" {
  default = {
    Component = "backend"
  }
}

variable "zone_name" {
  default = "aws-devops81s.online"
}