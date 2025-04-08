variable "OP_CONNECT_HOST" {
  type        = string
  description = "Onepass Connect URL"
}

variable "OP_CONNECT_TOKEN" {
  type        = string
  description = "The path to the service account JSON for OnePassword."
  sensitive   = true
  default     = null
}

variable "MINIO_URL" {
  type        = string
  description = "Minio Server URL"
  default     = "s3.kinzoku.dev"
}

variable "availability_zone" {
  description = "Availability Zone"
  type = string
  default = "us-east-1a"
}

variable "network_configuration" {
  description = "Network configuration for VPC and public subnet"
  type = object({
    vpc_cidr = string
    public_subnet_cidr = string
  })
  default = {
    vpc_cidr = "10.50.0.0/18"
    public_subnet_cidr = "10.50.25.0/24"
  }
}

variable "ssh_configuration" {
  type = object({
    public_key = string
    private_key = string
    ssh_port = number
  })
  default = {
    public_key = "~/.ssh/aws.pub"
    private_key = "~/.ssh/aws"
    ssh_port = 22
  }
}
