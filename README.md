# chat

This repository hosts Terraform code for deploying LibreChat, a real-time chat application with Azure Container Apps and Azure CosmosDB. The infrastructure is defined as code and deployed via GitHub Actions, making it easy to deploy and manage the chat application.

### Key Features

- **Lightweit:** Leveraging Azure Container Apps and CosmosDB for a lightweight and scalable chat application.
- **AI:** OpenAI and Azure OpenAI models for AI-powered chat capabilities.
- **Infrastructure as Code:** Includes Terraform configurations to simplify deployment and scalability.
- **CICD:** Deploys the chat application via GitHub Actions for automated testing and deployment.
- **Automated updates:** Renovate bot keeps dependencies up-to-date with automated pull requests.
- **Documentation:** Comprehensive guides and references to help with setup and customization.

## Requirements

For the initial setup, you will need the following tools:

- Azure Subscription
- OpenAI Developer Account
- CLI Tools:
    - azure-cli
    - GitHub CLI
    - jq

## Getting Started

1. Clone the repository to your local machine.
2. Run the `./scripts/up.sh` script to create the the necessary resources in Azure to store the Terraform state:
    - A Resource Group
    - A Storage Account and Blob Container
    - A Managed Identity with Role Assignments and Federated Credentials to run the GitHub Actions via OIDC.
3. Explore and modify the [Terraform code](src/README.md) as needed to fit your use case.
4. Push your changes to the main branch to trigger the GitHub Actions workflow.

By integrating these elements, the repository provides both a functional chat application and a robust framework for infrastructure management.

### up.sh script

This script creates the necessary resources in Azure to store the Terraform state.

You can set the variables in the script to match your desired configuration. Provide herefor the following variables in the script itself or as `.env` file:

- __name__ - the project name
- __scope__ - the scope, example: tf for the terraform environment
- __location__ - the Azure location to deploy the resources
- __tag__ - Tags
- __ghRepo__ - the github repository

This script will also create the following GitHub secrets that are needed for the GitHub Actions:

- ARM_CLIENT_ID
- ARM_SUB_ID
- ARM_TENANT_ID
- TF_STATE_RG
- TF_STATE_STAC
- TF_STATE_CONTAINER

### LibreChat authentication

For Authentication, the LibreChat application uses an GitHub App. The GitHub App is created in the GitHub repository and the GitHub App ID and the GitHub App secret are stored in the GitHub secrets.

[Here](https://www.librechat.ai/docs/configuration/authentication/OAuth2-OIDC/github) is the workflow for creating the GitHub App for LibreChat.

After the GitHub App is created, the following GitHub secrets are needed for the GitHub Actions:

- LIBRECHAT_APP_ID
- LIBRECHAT_APP_SECRET

### Renovate bot

To keep the dependencies up-to-date, the Renovate bot is used. The Renovate bot creates automated pull requests to update the dependencies. Renovate self-hosted is used to run the Renovate bot in the GitHub Actions. You can use a Personal Access Token (PAT) or a GitHub App to authenticate the Renovate bot. In this repository, the GitHub App is used to authenticate the Renovate bot. The workflow for creating the GitHub App for Renovate is described [here](https://docs.renovatebot.com/modules/platform/github/#running-as-a-github-app/).

After the GitHub App is created, the following GitHub secrets are needed for the GitHub Actions:

- RENOVATE_APP_ID
- RENOVATE_PRIVATE_KEY

### other GitHub secrets

- OPENAI_API_KEY - The OpenAI API key
- CLOUDFLARE_API_TOKEN - The Cloudflare API token
- CLOUDFLARE_ZONE_ID - The Cloudflare Zone ID
- CUSTOM_DOMAIN - The custom domain for the chat application

### GitHub Secret overview

Here is an overview of the GitHub secrets that are needed for the GitHub Actions to run Terraform and deploy the chat application:

- ARM_CLIENT_ID
- ARM_SUB_ID
- ARM_TENANT_ID
- TF_STATE_RG
- TF_STATE_STAC
- TF_STATE_CONTAINER
- LIBRECHAT_APP_ID
- LIBRECHAT_APP_SECRET
- RENOVATE_APP_ID
- RENOVATE_PRIVATE_KEY
- OPENAI_API_KEY
- CLOUDFLARE_API_TOKEN
- CLOUDFLARE_ZONE_ID
- CUSTOM_DOMAIN
