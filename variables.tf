variable user_data {
  default = ""
}

variable key_name {
  default = ""
}

variable subnet_id {
  default = ""
}

variable associate_public_ip_address {
  default = false
}

variable security_groups {
  type    = "list"
  default = []
}

variable "tags" {
  type = "map"

  default = {
    Name = "connectivity-tester"
  }
}

variable "private_ip" {
  type    = "string"
  default = ""
}
