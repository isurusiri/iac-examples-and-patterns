# EC2
resource "aws_instance" "public-main" {
    ami                    = var.AMIS[var.AWS_REGION]
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.main-public-sn-1.id
    vpc_security_group_ids = [aws_security_group.sg-allow-ssh.id]
    key_name               = aws_key_pair.devkeypair.key_name
}

output "public_ip_main" {
    value = aws_instance.public-main.public_ip
}
