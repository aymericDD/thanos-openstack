locals {
  query-flavor           = "s1-2"
  query-frontend-flavor  = "s1-2"
  thanos-receiver-flavor = "s1-2"
  monitoring-flavor      = "s1-2"
  benchmark-flavor       = "s1-2"
  os                     = "Debian 11"
  network_name           = "Ext-Net"
}

resource "openstack_compute_keypair_v2" "keypair" {
  name       = "my-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQChaUucPAlgOJBcc19aLsB42oXQYYIfFOy+tFa7r+ef1r2Wd8XtoB8llEEf9T7z+9UHFlr6yrahjJlcwjEcrmbBe6r8/lTvdfSHkwlAzb95257to4MJ4Nntb8TB1b7Xwz/RpBtAgnHZGuTimYvcNH8WPY1Cp8EcTAC/HWM+C07o9nk3Y4AKwBJoMb6+Nc+A6yWt46DM/d+TA3rbb/y0djT5KF6dYHylw5J9SKcyd0r+CHfjxmUBnBSgdM6OvcdU2cwhyOLGO54sTDIFi9r7So4MET6JaXFaD65fZys2QMFfni90VjPdTdEiC7I6FjuEOa3aAlNUbfr6UHjUxIh3/Y/BOxCp6qzBe4HwnKIlZjVODz7iinFcj3xshrDR4fq8tipM70gOdcpaYeSfjt0gA6itItkBaK04pj6IPvyEDSElD//ugkxaIrW/SuHHeh+aJgohsdJVFx4nP1NCdN6TdNocgiOEZUB3OTkP3a8W6UqRLnw8Mv82ZqBOKQO4R5cbyCUE55RygvLT8mFuA3/Ncho97fq6ZLGse5IoatLWlDWXkkxx5fosD9mO2r5wrCeoGodI9iQa3hIUWU8IR04m2+r5y9TvzJndpSidReU42ZFqu+siuNFtpztN35W7sE5lDvbs3I/kK2HKf5p2uzwOzcGQQAbIHYrJaeGPUaTPbRGlgw== adaurelle@adaurelle"
}

resource "openstack_compute_instance_v2" "thanos-query" {
  count           = var.thanos_query_instances
  name            = "thanos-query-${count.index}"
  image_name      = local.os
  flavor_name     = local.query-flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = local.network_name
  }
}

resource "openstack_compute_instance_v2" "thanos-query-frontend" {
  count           = var.thanos_query_frontend_instances
  name            = "thanos-query-frontend-${count.index}"
  image_name      = local.os
  flavor_name     = local.query-frontend-flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = local.network_name
  }
}

resource "openstack_compute_instance_v2" "thanos-receiver" {
  count           = var.thanos_receiver_instances
  name            = "thanos-receiver-${count.index}"
  image_name      = local.os
  flavor_name     = local.thanos-receiver-flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = local.network_name
  }
}

resource "openstack_compute_instance_v2" "nginx-lb-query" {
  count           = var.thanos_nginx_lb_query_instances
  name            = "nginx-lb-query-${count.index}"
  image_name      = local.os
  flavor_name     = local.thanos-receiver-flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = local.network_name
  }
}


resource "openstack_compute_instance_v2" "monitoring" {
  count           = var.monitoring_instances
  name            = "monitoring-${count.index}"
  image_name      = local.os
  flavor_name     = local.monitoring-flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = local.network_name
  }
}

resource "openstack_compute_instance_v2" "benchmark" {
  count           = var.benchmark_instances
  name            = "benchmark-${count.index}"
  image_name      = local.os
  flavor_name     = local.benchmark-flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = local.network_name
  }
}
