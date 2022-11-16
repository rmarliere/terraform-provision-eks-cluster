resource "aws_security_group" "node_group_one" {
  name_prefix = "${terraform.workspace}-node_group_one"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = var.protocol_tcp
      cidr_blocks = var.cidr1
    }
  }
}

resource "aws_security_group" "node_group_two" {
  name_prefix = "${terraform.workspace}-node_group_two"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = var.protocol_tcp
      cidr_blocks = var.cidr2
    }
  }
}
