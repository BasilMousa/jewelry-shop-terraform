# Jewelry Shop Terraform & Ansible Project


## Project Structure
```
jewelry-shop-terraform/
│
├── README.md                # Project documentation and instructions
│
├── terraform/               # All Terraform infrastructure code
│   ├── main.tf              # Orchestrates modules and passes variables/outputs
│   ├── variables.tf         # Global input variables for the infrastructure
│   ├── outputs.tf           # Global outputs for Ansible and documentation
│   ├── provider.tf          # AWS provider configuration
│   ├── backend.tf           # Remote state configuration (S3 + DynamoDB)
│   └── modules/             # Modularized resource definitions
│       ├── vpc/             # VPC, subnets, IGW, route tables
│       ├── ec2/             # EC2 app servers and Ansible host
│       ├── elb/             # Application Load Balancer
│       ├── security_groups/ # Security groups for ELB, EC2, Ansible host
│       └── s3_dynamodb/     # S3 bucket and DynamoDB table for state
│
├── ansible/                 # Ansible configuration and playbooks
│   ├── inventory.ini        # Inventory file (add EC2 IPs from Terraform outputs)
│   └── playbook.yml         # Main playbook for provisioning and deployment
│
├── app.py                   # Application code
├── functions.py             # Additional app logic
├── python/                  # App source code and modules
│   ├── functions.py
│   ├── main.py
│   └── __pycache__/         # (Can be ignored/deleted)
├── templates/               # HTML templates for your app
│   ├── add.html
│   ├── menu.html
│   ├── profit.html
│   ├── show.html
│   ├── sold.html
│   └── update.html
├── app.wsgi                 # WSGI entry point for web server
├── apache.conf              # Apache web server configuration
```
  main.tf            # Orchestrates modules and variables
  variables.tf       # Global input variables
  outputs.tf         # Global outputs for Ansible and documentation
  provider.tf        # AWS provider configuration
  backend.tf         # Remote state configuration (S3 + DynamoDB)
  modules/
    vpc/             # VPC, subnets, IGW, route tables
    ec2/             # EC2 app servers and Ansible host
    elb/             # Application Load Balancer
    security_groups/ # Security groups for ELB, EC2, Ansible host
    s3_dynamodb/     # S3 bucket and DynamoDB table for state
```

## Workflow
1. **Configure AWS Credentials**
   - Use environment variables or `aws configure`.
2. **Create EC2 Key Pair**
   - Manually create in AWS Console and set `key_name` variable.
3. **Initialize Terraform**
   - `cd terraform`
   - `terraform init`
4. **Plan Infrastructure**
   - `terraform plan`
5. **Apply Infrastructure**
   - `terraform apply`
6. **Outputs**
   - After apply, key info (EC2 IPs, ELB DNS) is shown for Ansible use.
7. **Configure Servers with Ansible**
   - Add EC2 IPs from Terraform outputs to `ansible/inventory.ini`.
   - Run the playbook:
     ```bash
     cd ansible
     ansible-playbook -i inventory.ini playbook.yml
     ```
8. **Destroy Infrastructure**
   - `terraform destroy` to remove all resources.

## Module Integration
- Each module is self-contained and receives variables from `main.tf`.
- Outputs from modules are exposed in `outputs.tf` for use by Ansible.
- Security groups, subnets, and resource IDs are passed between modules for full automation.

## Terraform State
- State is stored remotely in an S3 bucket (`jewelry-shop-basil-terraform`) and locked with DynamoDB (`jewelry-shop-lock-table-basil`).
- Both resources are provisioned by Terraform modules.

## Ansible Integration
- After Terraform deploys infrastructure, use the outputs (EC2 IPs, ELB DNS) as inventory for Ansible.
- Add the IPs to `ansible/inventory.ini`.
- Run `ansible-playbook -i inventory.ini playbook.yml` to install Python, Apache, and deploy your app code to EC2 instances.
- The application is accessible only via the ELB public endpoint.

## Destroy Process
- Run `terraform destroy` in the `terraform` directory to cleanly remove all resources.
- This includes VPC, subnets, EC2, ELB, security groups, S3 bucket, and DynamoDB table.

## Notes
- Do not hardcode AWS credentials in any Terraform or Ansible files.
- All resource logic is modularized for clarity and reuse.
- Unused resource files have been deleted after refactoring into modules.

## Contact
For any issues or questions, please contact the project maintainer.
