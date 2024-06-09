variable "aws_region" {
  type        = string
  description = "aws region to use for resources"
  default     = "us-east-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enables DNS hostnmes in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnet_count" {
  type        = number
  description = "Number of subnets going to be created"
  default     = 2
}

variable "number_of_instances" {
  type        = number
  description = "Number of instances going to be created"
  default     = 2
}
variable "vpc_public_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR Block for subnets in VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Maps public Ip on launching instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t2.micro"
}

variable "company" {
  type        = string
  description = "company name for resource tagging"
  default     = "globomantics"
}

variable "project" {
  type        = string
  description = "project name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "billing code for resource tagging"
}

variable "naming_prefix" {
  type        = string
  description = "naming prefix for all resources"
  default     = "globo-web-app"
}

variable "environment" {
  type        = string
  description = "envirronment for the resource"
  default     = "dev"
}