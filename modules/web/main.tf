resource "aws_launch_template" "mytem" {
name_prefix = "web-"
image_id = var.ami_id
instance_type = var.instance_type
vpc_security_group_ids = var.sg_ids
user_data = base64encode(var.user_data)
}
resource "aws_autoscaling_group" "web" {
desired_capacity = var.desired_capacity
max_size = var.max_size
min_size = var.min_size
vpc_zone_identifier = var.subnets
launch_template {
id = aws_launch_template.mytem.id
version = "$Latest"
}
tag {
key = "Name"
value = "web"
propagate_at_launch = true
}
}
resource "aws_lb" "weblb" {
internal = false
load_balancer_type = "application"
subnets = var.alb_subnets
security_groups = [var.alb_sg_id]
}
resource "aws_lb_target_group" "mytg" {
port = 80
protocol = "HTTP"
vpc_id = var.vpc_id
health_check {
path = "/"
}
}
resource "aws_lb_listener" "weblistener" {
load_balancer_arn = aws_lb.weblb.arn
port = 80
protocol = "HTTP"
default_action  {
type = "forward"
target_group_arn = aws_lb_target_group.mytg.arn
}
}
resource "aws_autoscaling_attachment" "web-tg" {
  autoscaling_group_name = aws_autoscaling_group.web.name
  lb_target_group_arn = aws_lb_target_group.mytg.arn
}
