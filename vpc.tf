resource "google_compute_network" "vpc-network" {
  name                    = "nextedge-vpc"
  auto_create_subnetworks = false
}  

resource "google_compute_subnetwork" "subnet" {
name	= "nextedge-subnet"
ip_cidr_range = "10.0.0.0/24"
region 	= "us-central1"
network = google_compute_network.vpc-network.id
}

#--New Subnets --
resource "google_compute_subnetwork" "subnet_europe" {
  name          = "nextedge-subnet-europe"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west1"
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_subnetwork" "subnet_asia" {
  name          = "nextedge-subnet-asia"
  ip_cidr_range = "10.0.2.0/24"
  region        = "asia-east1"
  network       = google_compute_network.vpc-network.id
}


# --- Firewall Rules ---

resource "google_compute_firewall" "allow_web" {
  name    = "allow-http-https"
  network = google_compute_network.vpc-network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}