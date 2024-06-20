variable "instace-ami" {
  description = "ami-id"
  type = string
  default = ""
}
variable "instace-family" {
    description = "instance type "
    type = string
    default = ""
}
variable "key-instace" {
  description = "connection of instace"
  type = string
  default = ""
}

#variable "name-insta" {
    #description = "name of the instace"
    #type = string
    #default = ""
  
#}
variable "diffname" {

    description = "different name of instce"
    type = list(string)
    default = [ "anil","kumar","ediga"]

}