#Sample CSV file
<#



#>





#This script is used to create organizational units in bulk

#Import active directory module
Import-Module activedirectory

#Import the data from CSV file.
$OUData = Import-csv C:\temp\oufile.csv

#Loop through each row containing  details in CSV file
foreach ($ou in $OUData)
{

$ouname = $ou.name
$oupath = $ou.path

New-ADOrganizationalUnit -Name $ouname -path $oupath 
}
