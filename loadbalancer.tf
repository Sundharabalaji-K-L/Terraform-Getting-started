data "aws_elb_service_account" "root" {}


resource "aws_lb" "nginx" {
  name               = "globo-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.app.public_subnets
  depends_on         = [module.web_app_s3]

  enable_deletion_protection = false
  access_logs {
    bucket  = module.web_app_s3.web_bucket.id
    prefix  = "alb-logs"
    enabled = true
  }
  tags = local.common_tags
}

resource "aws_lb_target_group" "nginx" {
  name     = "nginx-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.app.vpc_id
  tags     = local.common_tags
}

resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }
  tags = local.common_tags
}

resource "aws_lb_target_group_attachment" "nginx_instances" {
  count            = var.number_of_instances
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.nginx_instances[count.index].id
  port             = 80
}
