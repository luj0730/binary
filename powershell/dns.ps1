#nslookup github.com 8.8.8.8
while (1) {
    Resolve-DnsName -Name github.com -Server 8.8.8.8 | Format-List -Property IPAddress;
    Start-Sleep(1);
}