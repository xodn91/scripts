resource "aws_key_pair" "tf-ubuntu" {
  key_name   = "jl-tf-ubuntu"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "devops_demo" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.jl-tf-ubuntu.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script															`
