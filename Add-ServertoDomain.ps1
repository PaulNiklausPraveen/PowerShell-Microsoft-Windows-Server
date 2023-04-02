 
#Script to add server to Domain 
#Run Get-NetAdapter cmd to get interface index

$ComputerName="Server02"

Set-DnsClientServerAddress -InterfaceIndex  11 -ServerAddresses ("Primary DNS IP address in Domain Environment")

Set-DnsClientServerAddress -InterfaceAlias Ethernet -AddressFamily IPv4 |Select-Object ServerAddresses

Add-Computer -ComputerName $Computername -Domain "DomainName" -Restart
