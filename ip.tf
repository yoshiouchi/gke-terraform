resource "google_compute_address" "global_ip" {
  name         = var.global_ip_name
  address_type = "EXTERNAL"
  region       = var.region
}
resource "null_resource" "wait_for_ip" {
  depends_on = [google_compute_address.global_ip]
  provisioner "local-exec" {
    command = "sleep 30"
  }
}