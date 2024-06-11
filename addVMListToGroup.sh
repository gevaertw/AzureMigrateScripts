#!/bin/bash

# This script reads a text file line by line.  Each line is a VM in a Migration assesment.  It adds the VMs to a group in an assessment project
# The way this scipt loops over the file is presumably better than using the while loop, as the wile loop launches subshells and you cannot thak your vars from the subshell to the parent shell


# Define parameters
subscriptionId=05fe112a-5805-461b-aa95-ef3396b4141d
resourceGroupName=migtestAPI-rg
assessmentProjectName=justiceProject026e28project
assessmentGroupName=OracleDB05-apiGroup
location=swedencentral
textFile=vmsOnly03.csv

getVMFromProjectBaseURL="https://management.azure.com/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Migrate/assessmentProjects/${assessmentProjectName}/machines?api-version=2019-10-01"
updateMachinesBaseURL="https://management.azure.com/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Migrate/assessmentProjects/${assessmentProjectName}/groups/${assessmentGroupName}/updateMachines?api-version=2019-10-01"

mapfile -t lines < "$textFile"
# Iterate over the array
for line in "${lines[@]}"; do
    vmName=$(echo "$line"| tr -d '\r')
    echo "Adding: ${vmName} to the group"
    vmFilter="value[?properties.displayName=='${vmName}'].{id: id}"
    # echo "${vmFilter}"
    vmID=$(az rest --method get --url "$getVMFromProjectBaseURL" --query "value[?properties.displayName=='${vmName}'].{id: id}" -o tsv)
    updateMachinesBody=$(cat << EOF
{
    "properties": {
        "machines": ["\"$vmID\""],
        "operationType": "Add"
    }
}
EOF
)
    az rest --method post --url "${updateMachinesBaseURL}" --body "${updateMachinesBody}"
done