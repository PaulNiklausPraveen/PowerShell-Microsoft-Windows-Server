#This script is used to create organizational units in bulk

<# Sample CSV file

----------------------------------------
| Name |       Path                    |
----------------------------------------
|FRA   | OU=ADUsers,DC=company,DC=Com  |
----------------------------------------
|GER   | OU=ADUsers,DC=company,DC=Com  |
----------------------------------------
|SWZ   | OU=ADUsers,DC=company,DC=Com  |
----------------------------------------
|POL   | OU=ADUsers,DC=company,DC=Com  |
----------------------------------------

#>

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

