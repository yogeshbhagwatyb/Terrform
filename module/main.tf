resource "aws_instance" "instance2module" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"
  count         = 1
  key_name = "TF_key"
  tags = {
    Name = "uat"

  }
}

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}




resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "TF_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
