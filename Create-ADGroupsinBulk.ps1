#Script to create AD Groups in bulk

Import-Module ActiveDirectory -Verbose

$Groups = Import-Csv ("C:\Temp\GroupList.csv") 

Foreach ($Group in $Groups)
{

$ADGroupProperties = @{

      Name          = $Group.name
      Path          = $Group.path
      GroupScope    = $Group.scope
      GroupCategory = $Group.category
      Description   = $Group.description

      }

    New-ADGroup $ADGroupProperties
    
} 
