resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http_protocol"
  description = "this security group allows ssh and http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #var.pub_vpc/vpn_ip or include you personce pc IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #var.pub_vpc/vpn_ip or include you personce pc IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #var.pub_vpc/vpn_ip or include you personce pc IP
  }

}