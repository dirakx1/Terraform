# This recipe is based on technical definition

terraform {
  backend "gcs" {
    bucket = "" # CHANGE
  }
}

locals {
  all_apis  = "${var.apis}"
  bucket_id = "${var.bucket_id}"
}

# [START] APIs definition - ENABLE all_apis

resource "google_project_service" "enabling_api" {
  count              = "${length(local.all_apis)}"
  project            = "${var.project_name}"
  service            = "${element(local.all_apis, count.index)}"
  disable_on_destroy = false
}

# [END] APIs definition

# [START] Bucket definition

resource "google_storage_bucket" "terpel_project_bucket" {
  name          = "terraform-${local.bucket_id}"
  project       = "${var.project_name}"
  depends_on    = ["google_project_service.enabling_api"]
  force_destroy = "true"

  versioning = {
    enabled = "true"
  }
}

# [END] Bucket definition

# [START] Cloud run definition

resource "google_cloud_run_service" "ms" {
  name     = "ms-cloudrun"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello" #change
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"      = "1000"
        "run.googleapis.com/cloudsql-instances" = "my-project-name:us-central1:${google_sql_database_instance.instance.name}"
        "run.googleapis.com/client-name"        = "cloud-console"
      }
    }
  }
}

# Here will be other microservices described with cloud run

resource "google_sql_database_instance" "instance" {
  name   = "cloudrun-sql" # for ms
  region = "us-east1"
  settings {
    tier = "D0"
  }
}

# [END] Cloud run definition



