data "aws_ami" "linux_connectivity_tester" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "connectivity-tester-linux*",
    ]
  }

  owners = [
    "self",
  ]
}

resource "aws_instance" "ConnectivityTester" {
  ami                         = "${data.aws_ami.linux_connectivity_tester.id}"
  instance_type               = "t2.micro"
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${var.user_data}"
  monitoring                  = true
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.security_groups}"]
  iam_instance_profile        = "${aws_iam_instance_profile.instance_profile.id}"
  private_ip                  = "${var.private_ip}"
  tags                        = "${var.tags}"
}

resource "aws_iam_role" "iam_role" {
  name_prefix = "connectivity_tester"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "instance_profile" {
  name_prefix = "connectivity_tester"
  role        = "${aws_iam_role.iam_role.name}"
}

resource "aws_iam_role_policy" "iam_role_policy" {
  name_prefix = "connectivity_tester"
  role        = "${aws_iam_role.iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "cloudwatch:PutMetricData",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
      ],
        "Resource": [
          "arn:aws:logs:*:*:*"
      ]
    },
    {
        "Effect": "Allow",
        "Action": "ec2:DescribeTags",
        "Resource": "*"
    }
  ]
}
EOF
}
