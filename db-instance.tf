resource "google_sql_database_instance" "dbinstance" {
name		     = "nextedgesql-db"
region		     = "us-central1"
database_version = "MYSQL_8_0"
settings {
    tier = "db-f1-micro"
}

deletion_protection	= "false"
}


# --- New Instances ---

# New Instance 1: Additional MySQL Instance
resource "google_sql_database_instance" "mysql_db_two" {
  name             = "nextedgesql-db-two"
  region           = "us-central1" # Can be changed to another region if needed
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = false
}


# New Instance 2: PostgreSQL Instance
resource "google_sql_database_instance" "postgres_db" {
  name             = "nextedgepostgres-db"
  region           = "us-central1"
  database_version = "POSTGRES_15" # Set to PostgreSQL version
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = false
}