data "aws_ami" "amazonlinux_2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"

    values = ["al2023-ami-*-kernel-6.1-x86_64"] # x86_64
    # values = [ "al2023-ami-*-kernel-6.1-arm64" ] # ARM
    # values = [ "al2023-ami-minimal-*-kernel-6.1-x86_64" ] # Minimal Image (x86_64)
    # values = [ "al2023-ami-minimal-*-kernel-6.1-arm64" ] # Minimal Image (ARM)
  }
}
