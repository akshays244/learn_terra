resource "google_compute_instance" "vm" {
  count = var.instance_count
  name         = "${var.project_id}-server-${"terratest"}-${count.index}"
  machine_type = "e2-micro"
  zone         = var.zone
    scheduling {
    automatic_restart = !var.preemptible
    preemptible       = var.preemptible
    }


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
