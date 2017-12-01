output "public_dns" {
  value = "${aws_instance.ConnectivityTester.public_dns}"
}

output "public_ip" {
  value = "${aws_instance.ConnectivityTester.public_ip}"
}

output "id" {
  value = "${aws_instance.ConnectivityTester.id}"
}

output "availability_zone" {
  value = "${aws_instance.ConnectivityTester.availability_zone}"
}

output "placement_group" {
  value = "${aws_instance.ConnectivityTester.placement_group}"
}

output "key_name" {
  value = "${aws_instance.ConnectivityTester.key_name}"
}

output "ipv6_addresses" {
  value = "${aws_instance.ConnectivityTester.ipv6_addresses}"
}

output "network_interface_id" {
  value = "${aws_instance.ConnectivityTester.network_interface_id}"
}

output "primary_network_interface_id" {
  value = "${aws_instance.ConnectivityTester.primary_network_interface_id}"
}

output "private_dns" {
  value = "${aws_instance.ConnectivityTester.private_dns}"
}

output "subnet_id" {
  value = "${aws_instance.ConnectivityTester.subnet_id}"
}
