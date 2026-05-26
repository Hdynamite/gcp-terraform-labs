terraform {
   required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = "nextedge-497317"
  credentials = "nextedge-497317-03da74707c3e.json"
}

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
    subnetwork = "default"

    access_config {
    }
  }
}  
