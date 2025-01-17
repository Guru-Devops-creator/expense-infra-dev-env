module "app_alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true 
  name    = "${var.project_name}-${var.environment}-app-alb"
  vpc_id  = local.vpc_id
  subnets = local.private_subnet_ids
  security_groups = [data.aws_ssm_parameter.app_alb_sg_id.value]
  create_security_group = false 
  enable_deletion_protection = false
  tags = merge(
    var.common_tags,
    var.app_alb_tags,
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.app_alb.arn # Please verify app_alb modules to identify the output of app_alb 
  port              = "80"
  protocol          = "HTTP"

 default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1> hello i am from app alb</h1>"
      status_code  = "200"
    }
}
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "*.app-${var.environment}"  #*.app-dev.aws-devops81s.online
      type    = "A"
      alias   = {
        name    = module.app_alb.dns_name
        zone_id = module.app_alb.zone_id
      }
      allow_overwrite = true 
    }
  
  ]

}