# Internet gateway
resource "aws_internet_gateway" "main-igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "main_igw"
    }
}

# Route table
resource "aws_route_table" "main-public-rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-igw.id
    }

    tags = {
        Name = "main-public-rt"
    }
}

# Route table associations
resource "aws_route_table_association" "main-public-sn-1-rta" {
    subnet_id      = aws_subnet.main-public-sn-1.id
    route_table_id = aws_route_table.main-public-rt.id
}
