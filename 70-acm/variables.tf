variable zone_name {
  type        = string
  default     = "aws-devops81s.online"
 
}

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

variable "zone_id" {
    default = "Z09029931RLS4GGI08VA6"
}