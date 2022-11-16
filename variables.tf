variable "cidr1" {
  default = [
    "10.0.0.0/8",
  ]
}

variable "cidr2" {
  default = [
    "192.168.0.0/16",
  ]
}

variable "protocol_tcp" {
  default = "tcp"
}

variable "rules" {
  default = [
    {
      from_port = 80
      to_port   = 80
    },
    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 443
      to_port   = 443
    }
  ]
}
