// 1. Target group
// 2. Security group
// 3. Elastic Load Balancer
// 4. Listener Rule

################## Target Group ##################
resource "aws_lb_target_group" "main" {
  name     = "${var.env}-tg"
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
    port = var.app_port
  }
  tags = {
    Name = "${var.env}-tg"
  }
}
################## Application Load Balancer ##################
resource "aws_lb" "main" {
  name               = "${var.env}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnets

  # for_each is a meta argument like count
  # for is for loop
  tags = {
    Name = "${var.env}-alb"
  }
}
################## Application Load Balancer - Listener Rule ##################
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}