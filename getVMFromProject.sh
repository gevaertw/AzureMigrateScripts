#!/bin/bash

# Thsi script gets the ID of a VM in the migration project from the display name of the VM

# Define parameters
subscriptionId=05fe112a-5805-461b-aa95-ef3396b4141d
resourceGroupName=migtestAPI-rg
assessmentProjectName=justiceProject026e28project
assessmentGroupName=OracleDB04-apiGroup             
location=swedencentral
textFile=azureMigrationGroup1.csv
vmName=savadminasb001

# list all VMs in the project
getVMFromProjectBaseURL=https://management.azure.com/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Migrate/assessmentProjects/${assessmentProjectName}/machines?api-version=2019-10-01

#Only the names of the VMs
# az rest --method get --url $getVMFromProjectBaseURL  --query 'value[].properties.displayName' -o tsv > vmsOnly.csv

# VMName and ID
# az rest --method get --url $getVMFromProjectBaseURL  --query 'value[].{id: id, displayname: properties.displayName}' -o tsv  


# VMName from ID 
az rest --method get --url $getVMFromProjectBaseURL --query "value[?properties.displayName=='${vmName}'].{id: id}" -o tsv 


