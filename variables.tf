variable "your_region" {
  type        = string
  description = "Where you want your server to be. The options are here https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html."
}

variable "your_ip" {
  type        = string
  description = "Only this IP will be able to administer the server. Find it here https://www.whatsmyip.org/."
}

variable "keyname" {
  type        = string
  description = "Give you key pair a name"
}

variable "mojang_server_url" {
  type        = string
  description = "Copy the server download link from here https://www.minecraft.net/en-us/download/server/."
}