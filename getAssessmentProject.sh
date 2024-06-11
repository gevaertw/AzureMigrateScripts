#!/bin/bash

# get all assessment projects names in a resource group

# Define parameters
subscriptionId=05fe112a-5805-461b-aa95-ef3396b4141d
resourceGroupName=migtestAPI-rg

# set the right subscription id
az account set --subscription $subscriptionId
az resource list --resource-group $resourceGroupName  --query "[?type=='Microsoft.Migrate/assessmentProjects'].name" -o tsv
