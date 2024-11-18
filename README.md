# Miggo Azure Integration Module

Terraform module to integrate Miggo with Azure for enhanced cloud environment visibility. Enables detection of internet-facing services, anomalies, gaps, and drifts.

## Usage
```hcl
module "miggo_azure_integration" {
  source = "github.com/miggo-io/terraform-azure-miggo-integration"
}
```

## Requirements
- Terraform >= 0.13
- Azure Provider >= 3.0
- Azure AD Provider >= 2.0
- Active Miggo subscription

## Outputs
| Name | Description |
|------|-------------|
| tenant_id | Azure AD Tenant ID |
| client_id | Application Client ID |
| client_secret | Application Secret |
| assigned_subscriptions | List of subscriptions with Reader access |