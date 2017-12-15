variable user_data {
  default = false
}

variable key_name {
  default = false
}

variable subnet_id {
  default = false
}

variable associate_public_ip_address {
  default = false
}

variable security_groups {
  type    = "list"
  default = false
}

variable "tags" {
  type = "map"

  default = {
    Name = "connectivity-tester"
  }
}

variable "private_ip" {
  type    = "string"
  default = false
}
