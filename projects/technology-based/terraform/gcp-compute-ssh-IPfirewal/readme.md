# GCP Compute with SSH Firewal rule for User IP

To create a compute engine instance in Google Cloud Platform (GCP) with a security group (firewall rule) that allows only your IP address to SSH into the machine using Terraform, you can follow these steps:

### 1. Create a Terraform configuration file (`main.tf`):

```hcl
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
```

Replace placeholders like `"path/to/your/service/account/key.json"`, `"your-gcp-project-id"`, `<your-public-ip>` with your actual values.

### 2. Initialize and Apply Terraform:

Run the following commands in the directory containing your `main.tf` file:

```bash
terraform init
terraform apply
```

This will initialize Terraform and apply the configuration to create the compute instance and firewall rule.

### Important Note:

Make sure that you replace `<your-public-ip>` with your actual public IP address. You can find your public IP address by searching "What is my IP address" in a search engine.

Also, keep your GCP service account key (`key.json`) secure and do not expose it to unauthorized users.

This configuration allows SSH access only from your public IP address. Adjust other parameters like `project`, `region`, `machine_type`, `zone`, `image`, etc., based on your requirements.