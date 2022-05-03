# Public subnet
resource "aws_subnet" "main-public-sn-1" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.0.0/24"
    map_public_ip_on_launch = "true"
    availability_zone       = "ap-southeast-1a"

    tags = {
        Name = "main-public-sn-1"
    }
}