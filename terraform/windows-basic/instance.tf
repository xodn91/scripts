resource "aws_key_pair" "id_rsa" {
  key_name   = "id_rsa.pub"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "AD_JAMF" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
