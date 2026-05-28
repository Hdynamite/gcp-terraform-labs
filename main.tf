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

