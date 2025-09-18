resource "aws_lb" "app_elb" {
  name               = var.elb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = [var.elb_sg_id]

  tags = {
    Name = var.elb_name
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_elb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "app_attachment" {
  count              = length(var.app_server_ids)
  target_group_arn   = aws_lb_target_group.app_tg.arn
  target_id          = var.app_server_ids[count.index]
  port               = 80
}
