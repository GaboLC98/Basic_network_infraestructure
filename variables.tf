variable subnet_public_cidr_block {
    type = list(string)
}

variable subnet_private_cidr_block {
    type = list(string)
}

variable "av_zones" {
    type = list(string)  
}