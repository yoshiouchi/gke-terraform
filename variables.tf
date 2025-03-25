variable "project_id" {
  description = "Google Cloud Platform project ID"
  type        = string
}
variable "region" {
  description = "Google Cloud region"
  type        = string
}
variable "gke_options" {
  description = "GKE Options"
  type = object({
    cluster_name            = string
    node_locations          = list(string)
    enable_private_nodes    = bool
    enable_private_endpoint = bool
    master_ipv4_cidr_block  = string
  })
}
variable "network_options" {
  description = "Network Options"
  type = object({
    subnet_name   = string
    vpc_name      = string
    subnet_cidr   = string
    pods_cidr     = string
    services_cidr = string
    nat_name      = string
    router_name   = string
    global_ip     = string
  })
}
variable "bastion_options" {
  description = "Bastion Options"
  type = object({
    bastion_name           = string
    bastion_machine_type   = string
    bastion_image          = string
    bastion_startup_script = string
    bastion_tags           = list(string)
  })
}
variable "firewall_options" {
  description = "Firewall Options"
  type = object({
    firewall_name            = string
    firewall_ports           = list(string)
    firewall_source_ranges   = list(string)
    firewall_target_tags     = list(string)
  })
}
variable "service_account_roles" {
  description = "List of roles to be assigned to the bastion service account"
  type        = list(string)
}