This Terraform module creates a service principal and assigns Reader role across all accessible subscriptions.

## Prerequisites
- Azure CLI installed
- Terraform installed
- Appropriate Azure permissions

## Usage
1. Clone repository
2. Update provider files with your client_id
3. Update terraform.tfvars if needed
4. Run:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Variables
- client_id: The Application ID to install (default provided)

## Outputs
- tenant_id: The tenant ID where resources are deployed