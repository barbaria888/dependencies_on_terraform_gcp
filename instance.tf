resource "google_compute_instance" "vm_instance"{
    name="${var.instance_name}"
    zone="${var.instance_zone}"
    machine_type="${var.instance_type}"
    boot_disk{
        initialize_params{
            image="debian-cloud/debian-11"
        }
    }
    network_interface{
        network="default"
        access_config{
            nat_ip=google_compute_address.vm_static_ip.address             #this helps in specifying the ip and ensuring an implicit dependency in between instance and network id
        }
    }    
}

resource "google_compute_address" "vm_static_ip"{
    name="terraform-static-ip"
}    
