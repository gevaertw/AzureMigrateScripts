A collection of scripts that automates the Azure migration assesments.

In order to use the script you need to have the following:
- An azure migration project created in Azure, preferably one resource group per project.
- In the resource group you need look for the hidden items and copy the name of the assessment project.  The name is similar to the project name, but not the same


assessmentProjectName=  # This is the name of the migration project
assessmentGroupName=    # This is the name of the group that will be created in the assessment project

Also scripting examples for bash and az rest