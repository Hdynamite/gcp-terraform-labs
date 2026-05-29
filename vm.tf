resource "google_compute_instance" "nextedge" {
  name         = "nextedge-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 20 # GB
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
    }
  }
}  


# --- New VM in Europe Subnet (Ubuntu) ---
resource "google_compute_instance" "nextedge_europe" {
  name         = "nextedge-vm-europe"
  machine_type = "e2-micro"
  zone         = "europe-west1-b" # Must match the europe-west1 region

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 20
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_europe.id

    access_config {
      # Empty block allocates a public ephemeral IP
    }
  }
}

# --- New VM in Asia Subnet (Debian) ---
resource "google_compute_instance" "nextedge_asia" {
  name         = "nextedge-vm-asia"
  machine_type = "e2-micro"
  zone         = "asia-east1-a" # Must match the asia-east1 region

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # Changed to Debian 12
      size  = 20
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet_asia.id

    access_config {
      # Empty block allocates a public ephemeral IP
    }
  }
}