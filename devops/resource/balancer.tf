resource "aws_lb_target_group" "alb_target" {
    health_check {
      interval              = 10
      path                  = "/"
      protocol              = "HTTP"
      timeout               = 5
      healthy_threshold     = 5
      unhealthy_threshold   = 2
    }

    name                    = "ftce-alb"
    port                    = 8080
    protocol                = "HTTP"
    target_type             = "instance"
    vpc_id                  = "${aws_vpc.main_vpc.id}"
}

resource "aws_lb_target_group_attachment" "group_attachment" {
    target_group_arn        = aws_lb_target_group.alb_target.arn
    target_id               = "${aws_instance.ec2_backend-1.id}"
    port                    = 8080
}
resource "aws_lb_target_group_attachment" "group_attachment2" {
    target_group_arn        = aws_lb_target_group.alb_target.arn
    target_id               = "${aws_instance.ec2_backend-2.id}"
    port                    = 8080
}


resource "aws_lb" "alb-resourse" {
    name                    = "application-lb"
    internal                = false
    ip_address_type         = "ipv4"
    load_balancer_type      = "application"
    security_groups         = ["${aws_security_group.alb.id}"]
    subnets                 = ["${aws_subnet.public_east-a.id}", "${aws_subnet.public_east-b.id}","${aws_subnet.public_east-a.id}"]
}

resource "aws_lb_listener" "alb_listner" {
    load_balancer_arn       = "${aws_lb.alb-resourse.arn}"
    port                    = 8080
    protocol                = "HTTP"

    default_action{
        type                = "forward"
        target_group_arn    = "${aws_lb_target_group.alb_target.arn}"
    }
}