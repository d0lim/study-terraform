resource "aws_key_pair" "web_admin" {
  key_name   = "web_admin"
  public_key = file("~/.ssh/web_admin.pub")
}

resource "aws_security_group" "ssh" {
  name        = "allow_ssh_from_all"
  description = "Allow SSH port from all"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_security_group" "default" {
  name = "default"
  # 필요하다면, id를 기재해서 더 명확하게 그룹을 찾을 수 있다.
  # id = "<SECURITY_GROUP_ID>"
}

resource "aws_instance" "web" {
  ami           = "ami-0cbec04a61be382d9" # Amazon Linux 2 Kernel 5.10 AMI 2.0.20220426.0 x86_64 HVM gp2
  instance_type = "t3a.micro"
  key_name      = aws_key_pair.web_admin.key_name
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    data.aws_security_group.default.id
  ]
}

resource "aws_db_instance" "web_db" {
  allocated_storage   = 8
  engine              = "mysql"
  engine_version      = "5.6.35"
  instance_class      = "db.t2.micro"
  username            = "admin"
  password            = "study123"
  skip_final_snapshot = true
}
