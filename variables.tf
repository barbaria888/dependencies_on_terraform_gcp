variable "instance_name" {
    type=string
    description = "Name for Google Compute instance"
}
variable "instance_zone" {
    type=string
    description = "Zone for Google Compute Instance"
}
variable "instance_type"{
    type=string
    description ="Disk Type for Google Compute Instance"
    default ="e2-medium"
}
