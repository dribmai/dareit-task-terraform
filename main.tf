resource "google_compute_instance" "dareit-vm-ci" {
  name         = "dareit-vm-tf-ci"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["dareit"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

# modify the code of the main.tf to add a new bucket

resource "google_storage_bucket" "bucket" {
  name          = "task_7_bucket_terraform_ci"
  project       = "predictive-host-401610"
  storage_class = "standard"
  location      = "EU"
}