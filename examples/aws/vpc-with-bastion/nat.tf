# nat gw
resource "aws_eip" "nat" {
    vpc = true
}

# Define the NAT gateway
resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.main-public-sn-1.id
    depends_on    = [aws_internet_gateway.main-igw]
}


# Route table for private-NAT
resource "aws_route_table" "main-private-rt" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }

    tags = {
        Name = "main-private-rt"
    }
}

# Private route associations
resource "aws_route_table_association" "main-private-sn-1-rta" {
    subnet_id      = aws_subnet.main-private-sn-1.id
    route_table_id = aws_route_table.main-private-rt.id
}
