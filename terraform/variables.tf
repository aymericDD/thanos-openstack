variable "thanos_query_frontend_instances" {
  type    = number
  default = 1
}

variable "thanos_query_instances" {
  type    = number
  default = 1
}

variable "thanos_receiver_instances" {
  type    = number
  default = 1
}

variable "thanos_nginx_lb_query_instances" {
  type    = number
  default = 1
}

# variable "thanos_nginx_lb_receiver_instances" {
#   type    = number
#   default = 1
# }

