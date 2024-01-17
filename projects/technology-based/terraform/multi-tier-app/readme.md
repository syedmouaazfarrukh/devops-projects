### Real-World Use Case: Multi-Tier Web Application Infrastructure

**Problem Statement:**
You need to deploy a scalable and secure multi-tier web application infrastructure on AWS.

**Solution using Terraform:**

1. **Directory Structure:**
   Create a project structure with the following files as of this folder `multi-tier-app`.

2. **Network Configuration (`network/main.tf`):**
   Define the VPC, subnets, and route tables.

   ```hcl
   provider "aws" {
     region = var.region
   }

   module "vpc" {
     source          = "./network"
     region          = var.region
     vpc_cidr_block  = "10.0.0.0/16"
     public_subnet1  = "10.0.1.0/24"
     public_subnet2  = "10.0.2.0/24"
     private_subnet1 = "10.0.3.0/24"
     private_subnet2 = "10.0.4.0/24"
   }
   ```

3. **Compute Resources (`compute/main.tf`):**
   Create EC2 instances and configure security groups.

   ```hcl
   provider "aws" {
     region = var.region
   }

   module "web_servers" {
     source      = "./compute"
     region      = var.region
     vpc_id      = module.vpc.vpc_id
     subnet_ids  = module.vpc.public_subnet_ids
   }
   ```

4. **Database Configuration (`database/main.tf`):**
   Set up an RDS database.

   ```hcl
   provider "aws" {
     region = var.region
   }

   module "database" {
     source        = "./database"
     region        = var.region
     vpc_id        = module.vpc.vpc_id
     db_subnet_ids = module.vpc.private_subnet_ids
   }
   ```

5. **Variables and Outputs:**
   Define variables in `variables.tf` and outputs in `outputs.tf` files for better organization.

6. **Modules:**
   Break down your configuration into reusable modules for VPC, compute, and database to enhance modularity and maintainability.

7. **Run Terraform Commands:**
   Initialize and apply the Terraform configuration:

   ```bash
   terraform init
   terraform apply
   ```

8. **Review and Confirm:**
   Terraform will generate an execution plan. Review it and confirm by typing `yes` when prompted.

This example sets up a VPC with public and private subnets, launches EC2 instances in public subnets, and deploys an RDS database in private subnets. Adjust variables such as `region`, instance types, and database settings according to your requirements.

This use case illustrates a simplified version of a multi-tier architecture. In practice, you would consider additional aspects like load balancing, auto-scaling, and more advanced security configurations based on your application's needs. As your project grows, using Terraform modules, remote state storage, and best practices will contribute to a more scalable and maintainable infrastructure.