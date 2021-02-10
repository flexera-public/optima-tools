# Azure China CBI Upload Policy

## What it does

This Policy will poll the Azure China EA API, download the bill and upload it to CBI Bill Upload API.
This Policy will need to be applied every month with a new *Billing Period*

## Input Parameters

This policy has the following input parameters required when launching the policy.

- *Azure Enrollment ID* - Enrollment ID from Azure China Billing Portal
- *Bill Connect ID* - Bill Connect ID created in CBI API ex: `cbi-oi-azure-china-*`
- *Billing Period* - Billing Period from Azure Portal YYYY-MM
- *Email addresses* - A list of email addresses to notify

## Policy Actions

The following policy actions are taken on any resources found to be out of compliance.

- Upload Bill to Optima Endpoint
- Send an email report

## Prerequisites

This policy uses [credentials](https://docs.rightscale.com/policies/users/guides/credential_management.html) for connecting to the cloud -- in order to apply this policy you must have a credential registered in the system that is compatible with this policy. If there are no credentials listed when you apply the policy, please contact your cloud admin and ask them to register a credential that is compatible with this policy. The information below should be consulted when creating the credential.

### Credential configuration

For administrators [creating and managing credentials](https://docs.rightscale.com/policies/users/guides/credential_management.html) to use with this policy, the following information is needed:

A `API Key` Credential with the following configuration:

- Identifier: `azure_ea_china_$AZURE_ENROLLMENT_ID`
- Location: `header`
- Field: `Authorization`
- Type: `Bearer`
- Key: Azure Key from Portal
- Tags: `provider: azure_ea_china`

## Supported Clouds

- Azure

## Cost

This Policy Template does not launch any instances, and so does not incur any cloud costs.
