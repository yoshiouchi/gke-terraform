resource "google_compute_instance" "bastion" {
  name         = var.bastion_name
  machine_type = var.bastion_machine_type
  zone         = "${var.region}-a"
boot_disk {
    initialize_params {
      image = var.bastion_image
    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnetwork.self_link
  }
  metadata_startup_script = var.bastion_startup_script
  tags = var.bastion_tags
}

resource "google_compute_firewall" "allow_ssh_bastion" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }
  source_ranges = var.firewall_source_ranges
  target_tags = var.firewall_target_tags
}

resource "google_compute_firewall" "allow_http_https_rdp" {
  name    = "allow-http-https-rdp"
  network = google_compute_network.vpc_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "3389"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-http-https-rdp"]
}