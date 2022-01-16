data "aws_ami" "server_image" {
  owners      = ["679593333241"] #ec2 > AMIs > public images > search 'minecraft', look under 'owners' column
  most_recent = true
  filter {
    name   = "name"
    values = ["tidalmediainc.minecraft_bedrock_lgsm_ubuntu2004_upd2304-58559b67-8a4e-478f-9b13-fe7b08720669"]
  }
}

resource "aws_instance" "minecraft" {
  ami                         = data.aws_ami.server_image.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.minecraft.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.home.key_name
  user_data                   = "${file("server_setup.sh")}"
  tags = {
    Name = "Minecraft"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = tls_private_key.privatekey.private_key_pem
  }
  provisioner "file" {
    source="${local_file.setup_file.filename}"
    destination="/home/ubuntu/server-update-script.sh"
  }
}