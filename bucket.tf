resource "google_storage_bucket" "gcp-bucket" {
name	= "nexedge-bucket-ckm1243223"
location = "US"
storage_class = "STANDARD"
uniform_bucket_level_access = true
}

# --- New Buckets ---

# New Bucket 1: Located in the Europe Multi-Region
resource "google_storage_bucket" "gcp_bucket_europe" {
  name                        = "nexedge-bucket-europe-ckm1243223" # Must be globally unique
  location                    = "EU"                               # Europe multi-region
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}

# New Bucket 2: Located in a specific Asia Region (Tokyo)
resource "google_storage_bucket" "gcp_bucket_asia" {
  name                        = "nexedge-bucket-asia-ckm1243223"   # Must be globally unique
  location                    = "ASIA-NORTHEAST1"                  # Tokyo regional bucket
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}