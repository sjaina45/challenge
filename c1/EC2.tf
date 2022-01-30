resource "aws_spot_instance_request" "cheap_worker" {
  count                     = local.LENGTH
  ami                       = "ami-0fc800a3140d9997d"
  //spot_price                = "0.0031"
  instance_type             = "t3.micro"
  vpc_security_group_ids    = ["sg-03a75d657159b8990"]
  wait_for_fulfillment      = true
  //spot_type                 = "persistent"
  tags                      = {
    Name                    = "${var.ENV} - ${element(var.COMPONENTS, count.index)}"
  }
}

resource "aws_ec2_tag" "name-tag" {
  count                     = local.LENGTH
  resource_id               = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                       = "Name"
  value                     = "${var.ENV} - ${element(var.COMPONENTS, count.index)}"
}


locals {
  LENGTH    = length(var.COMPONENTS)
}