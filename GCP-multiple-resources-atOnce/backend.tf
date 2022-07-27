terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.30.0"
    }
  }
}

provider "google" {
  credentials = var.project4test.credentials_file_path
  project     = var.project4test.project_id
  region      = var.project4test.project_region
  zone        = var.project4test.project_zone
}