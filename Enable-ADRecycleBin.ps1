#Enable Active Directory Recycle Bin

$Domain= "Type your DomainName"

$DCserver = "Type your DC-ServerName"

Enable-ADOptionalFeature -Identity "Recycle Bin Feature" -Scope ForestOrConfigurationSet -Target $Domain -Server $DCserver -Confirm:$false
