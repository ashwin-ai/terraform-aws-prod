resource "aws_instance" "terraform_ec2" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "terraform-amazon-linux-2023"
  }
}
