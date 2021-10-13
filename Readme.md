# This Terraform template will create the following resources

1. EC2 instance with autoscaling group and launch configuration
2. Application load balancer with target groups
3. Provision 2 websites on single domain, sub-domains pointing to each one

# Prerequisites

- Make sure you have an Aws account.
- Iam user created with access key, secret key and has permission to create security group, ec2 instance, elb.

# Steps to Provision

1. Export environment variables access_key and secret_access_key
2. Edit the following variables in environment/dev.tfvars file
• private_subnet_1_id
• public_subnet_1_id
• public_subnet_2_id
• ssh_keypair_name
• vpc_id
• bucket name in config.tf file
3. Run terraform init \
-backend-config="bucket=nmgbucket" \
-backend-config="key=New/terraform.tfstate" \
-backend-config="region=us-east-2" -reconfigure to initialize working directory containing Terraform configuration files. (Modify the name of the bucket)
4. Run "terraform plan -var-file=environments/dev.tfvars" to create an execution plan
5. Run "terraform apply -var-file=environments/dev.tfvars -auto-approve" to execute the actions proposed in a Terraform plan.
6. To test if this work is successful, two curl commands can be run:

• curl -H 'Host: test1.foo.io' http://{alb}
• curl -H 'Host: test2.foo.io' http://{alb}
7. Once you finish testing you can destroy the provisioned infrastructure using "terraform destroy -var-file=environments/dev.tfvars -auto-approve"