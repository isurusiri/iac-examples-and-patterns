# EC2
resource "aws_instance" "public-bastion" {
    ami                    = var.AMIS[var.AWS_REGION]
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.main-public-sn-1.id
    vpc_security_group_ids = [aws_security_group.sg-allow-ssh.id]
    key_name               = aws_key_pair.devkeypair.key_name
}

resource "aws_instance" "private-example" {
    ami                    = var.AMIS[var.AWS_REGION]
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.main-private-sn-1.id
    vpc_security_group_ids = [aws_security_group.sg-allow-ssh.id]
    key_name               = aws_key_pair.devkeypair.key_name
}

output "public_ip_bastion" {
    value = aws_instance.public-bastion.public_ip
}
