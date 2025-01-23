resource "aws_lb" "cafe" {
  name               = var.aws_lb_name
  internal           = var.aws_lb_internal
  load_balancer_type = var.aws_lb_type
  subnets            = [var.aws_lb_subnets]

  enable_deletion_protection = var.aws_lb_protection

  tags = {
    Environment = var.aws_lb_env
  }
}



resource "aws_lb_target_group" "cafe" {
  name     = var.aws_target_name
  port     =  var.aws_target_port
  protocol =  var.aws_target_protocol
  vpc_id   = var.aws_target_vpc_id
  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.aws_target_timeout
    interval            = var.aws_target_interval
    protocol            = var.aws_target_protocol
  }
}



resource "aws_lb_target_group_attachment" "test" {
 
  count            = length(var.target_id)
  target_group_arn = aws_lb_target_group.cafe.arn
  target_id        = var.target_id[count.index] 
  port             = var.aws_target_port
}



resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.cafe.arn
  port              = var.aws_target_port
  protocol          = var.aws_target_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cafe.arn
  }
}