# nat gw
resource "aws_eip" "nat" {
    vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.main-public-sn-1.id
    depends_on    = [aws_internet_gateway.main-gw]
}

