# Array of websites containg threat intell

$drop_urls = @('https://rules.emergingthreats.net/blockrules/emerging-botcc.rules','https://rules.emergingthreats.net/blockrules/compromised-ips.txt')

# Loop through the URLs for the rules list

foreach ($u in $drop_urls) {


    # Extract the filename

    $temp = $u.split("/")
    

    # The last element in the array plucked off is the filename

    $file_name = $temp[-1]

    if (Test-Path "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Homework\$file_name") {

        Write-Host -BackgroundColor "green" -ForegroundColor "white" "The file $file_name already exists."

        continue


    } else {

        # Download the rules list
        Invoke-WebRequest -Uri $u -OutFile "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Homework\$file_name"

        Write-Host -BackgroundColor "red" -ForegroundColor "white" "The file $file_name wasn't detected but it was just downloaded. Check the file path to make sure."


    }

    


}

# Array containing the filename

$input_paths = @('.\compromised-ips.txt', '.\emerging-botcc.rules')

# Extract IP addressess

$regex_drop = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'

# Append the IP addresses to the temporary IP list.

Select-string -Path $input_paths -Pattern $regex_drop | `

ForEach-Object { $_.Matches } | `

ForEach-Object { $_.Value } | Sort-Object | Get-Unique | `

Out-File -FilePath "ips-bad.tmp"

# OS Selection

$var = Read-Host -Prompt "Please enter Windows or IPTables"

switch ($var)
{

    # Setting up the IPlist in Windows firewall

    Windows {(Get-Content -Path "ips-bad.tmp") | % `
    {"netsh advfirewall firewall add rule name =`"Block specific IPs $_`" action=nlock dir=in remoteip=$_"} | `
    Out-File -FilePath "Block_WindowsIPs.bat" | `
    Set-SCPItem -ComputerName '192.168.6.71' -Port 2222 -Credential (Get-Credential asani.vessup)`
    -Destination '/home/asani.vessup' -Path '.\Block_WindowsIPs.bat'}


    IPTables {(Get-Content -Path ips-bad.tmp) | % `
    { $_ -replace "^", "iptables -A INPUT -s " -replace "$", " -j DROP"} | `
    Out-File -FilePath ".\iptables.bash" | Set-SCPItem -ComputerName '192.168.6.71' -Port 2222 -Credential (Get-Credential asani.vessup)`
    -Destination '/home/asani.vessup' -Path '.\iptables.bash'}

}







# Get the IP addresses discovered, loop through and replace the beginning of the line with the IPTables syntax
# After the IP address, add the remaining IPTables syntax and save the results to a file. 

# iptables -A INPUT -s IP -j DROP

# (Get-Content -Path "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Class\ips-bad.tmp") | % `
# { $_ -replace "^", "iptables -A INPUT -s " -replace "$", " -j DROP" } | `
# Out-File -FilePath "iptables.bash"


