resource "tls_private_key" "privatekey" { #create private key in terraform runtime
  algorithm = "RSA"
}

resource "aws_key_pair" "home" { #used to give key a name
  key_name   = var.keyname
  public_key = tls_private_key.privatekey.public_key_openssh
}

resource "local_file" "private-key-local" {
  content  = tls_private_key.privatekey.private_key_pem
  filename = "${var.keyname}.pem" #creates private key in this folder
}

data "template_file" "setup_script" {
  template = templatefile("server_update.sh", {
    mojang_server_url = var.mojang_server_url
  })
}

resource "local_file" "setup_file" { #create afile with script template - send to remote machine
  content= data.template_file.setup_script.rendered
  filename="server_update_remote.sh"
}
output "updatescriptoutput" {
  value = data.template_file.setup_script.rendered
}

output "instance_ip_addr" {
  value = aws_instance.minecraft.public_ip
}
