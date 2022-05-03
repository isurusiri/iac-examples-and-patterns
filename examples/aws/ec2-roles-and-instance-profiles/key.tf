resource "aws_key_pair" "devkeypair" {
    key_name   = "devkeypair"
    public_key = file(var.PATH_TO_PUBLIC_KEY)

    lifecycle {
        ignore_changes = [public_key]
    }
}
