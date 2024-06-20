# case-1 --> no.of instace with same name
# case-2 --> no.of instace  same name with  index (ex tier-1,tier-2)
# case-3 --> no.of instace with diffrent name (ex dev,produ)
# case-4 --> create dyanamic instace (based on varible/name's lenth )
resource "aws_instance" "local" {
    ami = var.instace-ami
    instance_type = var.instace-family
    key_name = var.key-instace
    tags = {
       # Name = var.name-insta     #no.of instace with same name
       # Name = "tier-${count.index}"     # no.of instace  same name with  index (ex tier-1,tier-2)
        Name = var.diffname[count.index] # no.of instace with diffrent name (ex dev,produ)
    
    }
    count = length(var.diffname)  # case-4 --> create dyanamic instace (based on varible/name's lenth )
}
