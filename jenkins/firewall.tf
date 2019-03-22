resource "google_compute_firewall" "ssh-firewall" {
  name    = "ssh-firewall"
  network = "${google_compute_network.web.name}"

  // ping
  allow {
    protocol = "icmp"
  }

  // ssh
  allow {
    protocol = "tcp"
    ports    = ["443", "22"]
  }

  // web
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  source_tags = ["web"]
}
