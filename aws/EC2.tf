# Create a new instance of the latest Ubuntu 20.04 on an
# t3.micro node with a variable AWS Tag
# Add datadog configuration and add cloudwatch configuration
# Trigger alert when "ERROR" pops out on the logs

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.tag
  }
}

# Cloudwatch configuration


module "cloudwatch_example_complete-log-metric-filter-and-alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//examples/complete-log-metric-filter-and-alarm"
  version = "1.3.0"
}


# Create a new Datadog - Amazon Web Services integration
resource "datadog_integration_aws" "sandbox" {
  account_id  = "1234567890"
  role_name   = "DatadogAWSIntegrationRole"
  filter_tags = ["key:value"]
  host_tags   = ["key:value", "key2:value2"]
  account_specific_namespace_rules = {
    auto_scaling = false
    opsworks     = false
  }
  excluded_regions = ["us-east-1", "us-west-2"]
}

