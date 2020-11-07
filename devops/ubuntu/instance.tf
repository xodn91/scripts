resource "aws_instance" "it-test" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "100x-IT"
  vpc_security_group_ids = [ "sg-06b27c7f46807dc92" ]
tags = {
    Name = "Terraform IT Instance"
  }
root_block_device {
    volume_size = "100"
  }
}

