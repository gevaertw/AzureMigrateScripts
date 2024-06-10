#!/bin/bash
subscriptionId=05fe112a-5805-461b-aa95-ef3396b4141d
resourceGroupName=migtestAPI-rg
assessmentProjectName=justiceProject026e28project
assessmentGroupName=OracleDB05-apiGroup
location=swedencentral
textFile=azureMigrationGroup1.csv


# create the group using az cli
groupCreateBaseURL="https://management.azure.com/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Migrate/assessmentProjects/${assessmentProjectName}/groups/${assessmentGroupName}?api-version=2019-10-01"
groupCreateBody=$(cat << EOF
{
   properties: {
      groupType: "Import",
      supportedAssessmentTypes: ["MachineAssessment","AvsAssessment"]
   }
}
EOF
)

# echo $groupCreateBaseURL
# echo $groupCreateBody
az rest --method put --url $groupCreateBaseURL --body "${groupCreateBody}"

