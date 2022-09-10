provider "google" {
  credentials = file("./auth.json")
  project = "cloudprojectterraform"
  region = "us-east1"
  zone = "us-east1-c"
}
resource "google_compute_network" "vpc_network" {
  name = "practice-network"
  auto_create_subnetworks = true
}

terraform {
  backend "gcs" {
    bucket = "tf-state-prod-abdulmalik"
    prefix = "terraform-practice/"
    # credentials = file("./auth.json")
  }
}