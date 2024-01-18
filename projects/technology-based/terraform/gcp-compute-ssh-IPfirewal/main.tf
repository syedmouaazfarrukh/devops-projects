provider "google" {
  credentials = file("path/to/your/service/account/key.json")
  project     = "your-gcp-project-id"
  region      = "us-central1"  # Change to your desired region
}

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "n1-standard-1"  # Change to your desired machine type
  zone         = "us-central1-a"  # Change to your desired zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"  # Change to your desired image
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_firewall" "ssh_firewall" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["<your-public-ip>/32"]  # Replace with your public IP address
}
