#!/bin/bash
# Define parameters
resourceGroupName=migTestBicep12-rg
assessmentProjectName=migTestBicepProject12
assessmentGroupName=migTestBicepGroup12
location=swedencentral
bicepFile=./createAssessmentProject.bicep

# Login to Azure
# az login

# Create resource group if it doesn't exist
az group create --name $resourceGroupName --location $location

# Deploy migration project in Azure
az deployment group create --resource-group $resourceGroupName --template-file $bicepFile --parameters assessmentProjectName=$assessmentProjectName location=$location


