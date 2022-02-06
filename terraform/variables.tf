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

variable "monitoring_instances" {
  type    = number
  default = 1
}

variable "benchmark_instances" {
  type    = number
  default = 1
}

