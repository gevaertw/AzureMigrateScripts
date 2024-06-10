#!/bin/bash
subscriptionId=05fe112a-5805-461b-aa95-ef3396b4141d
resourceGroupName=migtestAPI-rg
assessmentProjectName=justiceProject026e28project
assessmentGroupName=OracleDB04-apiGroup
location=swedencentral
textFile=azureMigrationGroup1.csv

# add a VM
updateMachinesBaseURL="https://management.azure.com/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Migrate/assessmentProjects/${assessmentProjectName}/groups/${assessmentGroupName}/updateMachines?api-version=2019-10-01"
updateMachinesBody=$(cat << EOF
{
    properties: {
        machines: ["savadminasb001"],
        operationType: "Add"
   }
}
EOF
)
echo $updateMachinesBaseURL
echo $updateMachinesBody
az rest --method post --url $updateMachinesBaseURL --body "${updateMachinesBody}"

