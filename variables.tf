variable "env" {
  type    = string
  default = "dev"
}
variable "app_port" {
  type    = number
  default = 80
}
variable "vpc_id" {
  type    = string
  default = "vpc-064fe67e"
}
variable "subnets" {
  type    = list(string)
  default = ["subnet-3a604771", "subnet-929b8ec8"]
}