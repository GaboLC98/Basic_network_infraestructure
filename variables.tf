variable "subnets_quantity" {
  type = number
}

variable "instance_quantity" {
  type = number
}

variable "subnet_private_cidr_block" {
  type = list(string)
}

variable "av_zones" {
  type = list(string)
}

variable "VPC_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}