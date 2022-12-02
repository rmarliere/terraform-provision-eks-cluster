variable "cluster_name" {
  description = "The name to use for all cluster resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC id created"
  type        = string
}

variable "private_subnets" {
  description = "Subnet IDs"
  type        = list(any)
}

variable "aws_sg_node_group_one_id" {
  description = "value"
  type        = string

}

variable "aws_sg_node_group_two_id" {
  description = "value"
  type        = string

}