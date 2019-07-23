data "template_file" "launch" {
  template = "${file("${path.module}/user-data.sh.tpl")}"
}

resource "aws_instance" "web" {
  ami             = "${var.ami_id}"
  instance_type   = "${var.instance_type}"
  user_data       = "${data.template_file.launch.rendered}"
  key_name        = "${var.key_name}"
  security_groups = ["${aws_security_group.kibana}"]

  tags = {
    Name = "${var.instance_name}"
  }
}

resource "aws_security_group_rule" "ingress_instance_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]

  security_group_id        = "${aws_security_group.kibana.id}"
}

resource "aws_security_group_rule" "egress_instance_all" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  cidr_blocks              = ["0.0.0.0/0"]

  security_group_id        = "${aws_security_group.kibana.id}"
}

resource "aws_security_group_rule" "ingress_kibana" {
  type                     = "ingress"
  from_port                = 5601
  to_port                  = 5601
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]

  security_group_id        = "${aws_security_group.kibana.id}"
}

resource "aws_security_group" "kibana" {
  name        = "${var.instance_name}-sg-kibana"
  description = "Allow users to open kibana"

  tags = {
    Name = "${var.instance_name}-sg-kibana"
  }

}
