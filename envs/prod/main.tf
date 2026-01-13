resource "aws_instance" "terraform_ec2" {
  ami                         = "ami-0c02fb55956c7d316"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "terraform-amazon-linux-2023"
  }

  # 🔐 SSH connection
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("keypair-new.pem")
    host        = self.public_ip
  }

  # 🚀 Remote provisioning
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y dnf-plugins-core",
      "sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo",
      "sudo dnf install -y terraform",
      "terraform -version"
    ]
  }
}
