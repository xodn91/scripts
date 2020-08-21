variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "key_name" {
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-032c2c4b952586f02"
    us-east-2 = "ami-0239d3998515e9ed1"
    us-west-1 = "ami-08bcc13ad2c143073"
    us-west-2 = "ami-029e27fb2fc8ce9d8"
    eu-west-1 = "ami-0b5271aea7b566f9a"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ah-devops"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa.pub"
}
