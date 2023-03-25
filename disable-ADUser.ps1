#Disable AD users

#for single:
Import-Module ActiveDirectory
Disable-ADAccount -Identity user1

#For Disabling multiple users,

Import-Module ActiveDirectory

Import-Csv "C:\Temp\Users.csv" | ForEach-Object {

$samAccountName = $_."samAccountName"

Try { Get-ADUser -Identity $samAccountName | Disable-ADAccount  
}

Catch {
 
Write-Host "user:"$samAccountname "is not present in Active Directory  Environment"
}
}
