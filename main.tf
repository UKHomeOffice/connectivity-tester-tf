data "aws_ami" "linux_connectivity_tester" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "connectivity-tester-linux*",
    ]
  }

  owners = [
    "093401982388",
  ]
}

resource "aws_instance" "ConnectivityTester" {
  ami                         = "${data.aws_ami.linux_connectivity_tester.id}"
  instance_type               = "t2.nano"
  subnet_id                   = "${var.subnet_id}"
  vpc_security_group_ids      = "${var.vpc_security_group_ids}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${var.user_data}"
  monitoring                  = true
  key_name                    = "${var.key_name}"
  security_groups             = "${var.security_groups}"
  iam_instance_profile        = "${aws_iam_policy.policy.id}"
}

resource "aws_iam_policy" "policy" {
  name_prefix = "connectivity_tester"
  path        = "/"
  description = "Allow Connectivity Tester to publish to cloudwatch"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
