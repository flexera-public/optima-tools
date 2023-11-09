# Sandbox Management - Terminate Old Policies

## What It Does

This policy will terminate old applied policies that meet the criteria specified by the user. This is to assist in keeping testing, development, and sandbox environments clean of old policies that are no longer being used.

## Functional Description

This policy uses the [Flexera Automation Policy API](https://reference.rightscale.com/governance-policies) to retrieve a list of applied policies. The policies are then filtered for just the ones that meet the user-specified criteria and terminated.

## Input Parameters

This policy has the following input parameters required when launching the policy.

- *Termination Age (Days)* - How many days ago a policy must have been applied before it is terminated.
- *Created / Updated* - Whether to use the date the applied policy was created or the date it was last updated to determine its age.
- *Policy Ignore List* - A list of policy template names to never terminate despite their age.
- *Applied Policy Ignore List* - A list of applied policy names to never terminate despite their age.

## Policy Actions

- Terminate old applied policies.

## Prerequisites

This Policy Template uses [Credentials](https://docs.flexera.com/flexera/EN/Automation/ManagingCredentialsExternal.htm) for authenticating to datasources -- in order to apply this policy you must have a Credential registered in the system that is compatible with this policy. If there are no Credentials listed when you apply the policy, please contact your Flexera Org Admin and ask them to register a Credential that is compatible with this policy. The information below should be consulted when creating the credential(s).

- [**Flexera Credential**](https://docs.flexera.com/flexera/EN/Automation/ProviderCredentials.htm) (*provider=flexera*) with access to view and terminate applied policies.

The [Provider-Specific Credentials](https://docs.flexera.com/flexera/EN/Automation/ProviderCredentials.htm) page in the docs has detailed instructions for setting up Credentials for the most common providers.
