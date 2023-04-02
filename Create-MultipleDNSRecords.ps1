#This script will create multiple DNS records

$DNSRecords=Import-csv "C:\Temp\DNS.csv"
$DCName="DomainServer"
$ZoneName="Company.com"

Foreach($DNSRecord in $DNSRecords) 
{
    Add-DnsserverResourceRecordA -Name $DNSRecord.Name -IPv4Address $DNSRecord.ip -ZoneName $ZoneName -ComputerName $DCName
}
