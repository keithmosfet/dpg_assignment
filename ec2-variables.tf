# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"  
}

# AWS EC2 Private Instance Count
variable "private_instance_count" {
  description = "AWS EC2 Private Instances Count"
  type = number
  default = 1  
}