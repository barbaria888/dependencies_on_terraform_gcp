
#another instance spins up
resource "google_compute_instance" "another_instance"{
    name="terraform-instance-2"
    machine_type="e2-micro"
    boot_disk{
        initialize_params{
            image="debian-cloud/debian-11"
        }
    }
    network_interface{
        network="default"
        access_config{
        }
    }
#this instance dependent upon another storage bucket created
depends_on=[google_storage_bucket.example_bucket]
# the order of writing the code does not matter during creation, they are created on basis of implicit and explicit dependency always
    }
#a storage bucket spinning up
resource "google_storage_bucket" "example_bucket"{
    name= "qwiklabs-gcp-04-f7cce47df402_05_07"
    location="US"
    website{
        main_page_suffix="index.html"

        not_found_page="404.html"
    }
}

