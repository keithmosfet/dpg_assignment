# Autoscaling with Launch Configuration - Both created at a time
module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "4.1.0"

  # Autoscaling group
  name            = "${local.name}-myasg1"
  use_name_prefix = false

  min_size                  = 0
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
 # health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.private_subnets
  # Associate ALB with ASG
  target_group_arns         = module.alb.target_group_arns

  # ASG Instance Referesh
  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 50
    }
    # Desired Capacity here added for demonstrating the Instance Refresh scenario
    triggers = ["tag", "desired_capacity"]
  }

  # ASG Launch configuration
  lc_name   = "${local.name}-mylc1"
  use_lc    = true
  create_lc = true

  #This grabs the data & ami from the datasource-ami.tf
  image_id          = data.aws_ami.amzlinux2.id
  #takes from ec2instance-variables
  instance_type     = var.instance_type
  user_data         = file("${path.module}/app1-install.sh")
  ebs_optimized     = true
  enable_monitoring = true
  #This comes from the security groups output file
  security_groups             = [module.private_sg.this_security_group_id]
  associate_public_ip_address = false

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      delete_on_termination = true
      encrypted             = true
      volume_type           = "gp2"
      volume_size           = "20"
    },
  ]

  root_block_device = [
    {
      delete_on_termination = true
      encrypted             = true
      volume_size           = "15"
      volume_type           = "gp2"
    },
  ]

  metadata_options = {
    http_endpoint               = "enabled"
    # At production you can change to "required", for our example if is optional we can get the content in metadata.html
    http_tokens                 = "optional"
    http_put_response_hop_limit = 32
  }

#  tags        = local.asg_tags
}
