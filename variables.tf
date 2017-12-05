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
