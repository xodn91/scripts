variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-east-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0bcc094591f354be2"
    us-east-2 = "ami-0bbe28eb2173f6167"
    us-west-1 = "ami-0dd005d3eb03f66e8"
    us-west-2 = "ami-0a634ae95e11c6f91"
    eu-west-1 = "ami-07ee42ba0209b6d77"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/Downloads/secure/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/Downloads/secure/mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
