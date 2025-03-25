cluster_name           = "yoshi-gke-lab"
vpc_name               = "vpc-primary"
subnet_name            = "subnet-primary"
gke_node_cidr          = "10.0.0.0/20"
pods_cidr              = "10.4.0.0/14"
svc_cidr               = "10.32.0.0/20"
gke_master_cidr        = "172.16.0.0/28"
nat_router_name        = "nat-router-primary"
nat_name               = "nat-primary"
global_ip_name         = "global-ip-primary"
master_ipv4_cidr_block = "172.16.1.0/28"

bastion_name           = "yoshi-bastion"
bastion_machine_type   = "e2-medium"
bastion_image          = "ubuntu-2404-lts-amd64"
bastion_startup_script = <<-EOT
  #!/bin/bash
  sudo apt-get update
  sudo apt-get install -yq git
EOT
bastion_tags           = ["bastion"]
firewall_name           = "allow-ssh-bastion"
firewall_ports          = ["22"]
firewall_source_ranges  = ["0.0.0.0/0"]
firewall_target_tags    = ["bastion"]
service_account_roles  = [
  "roles/logging.logWriter",
  "roles/monitoring.metricWriter",
  "roles/monitoring.viewer",
  "roles/compute.osLogin",
  "roles/compute.admin",
  "roles/iam.serviceAccountUser",
  "roles/container.admin",            
  "roles/container.clusterAdmin",      
  "roles/compute.osAdminLogin"
]