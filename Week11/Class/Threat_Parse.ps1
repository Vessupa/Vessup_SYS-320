# Array of websites containg threat intell

$drop_urls = @('https://rules.emergingthreats.net/blockrules/emerging-botcc.rules','https://rules.emergingthreats.net/blockrules/compromised-ips.txt')

# Loop through the URLs for the rules list

foreach ($u in $drop_urls) {


    # Extract the filename

    $temp = $u.split("/")
    

    # The last element in the array plucked off is the filename

    $file_name = $temp[-1]

    if (Test-Path "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Class\$file_name") {

        Write-Host -BackgroundColor "green" -ForegroundColor "white" "The file $file_name already exists."

        continue


    } else {

        # Download the rules list
        Invoke-WebRequest -Uri $u -OutFile "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Class\$file_name"

        Write-Host -BackgroundColor "red" -ForegroundColor "white" "The file $file_name wasn't detected but it was just downloaded. Check the file path to make sure."


    }

    


}

# Array containing the filename

$input_paths = @('Week11\class\compromised-ips.txt', 'Week11\class\emerging-botcc.rules')

# Extract IP addressess

$regex_drop = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'

# Append the IP addresses to the temporary IP list.

Select-string -Path $input_paths -Pattern $regex_drop | `

ForEach-Object { $_.Matches } | `

ForEach-Object { $_.Value } | Sort-Object | ` 

Get-Unique | `

Out-File -FilePath "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Class\ips-bad.tmp"

# Get the IP addresses discovered, loop through and replace the beginning of the liune with the IPTables syntax
# After the IP address, add the remaining IPTables syntax and save the results to a file. 

# iptables -A INPUT -s IP -j DROP

(Get-Content -Path "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Class\ips-bad.tmp") | % `

{ $_ -replace "^","iptables -A INPUT -s " -replace "$", " -j DROP"} | `

Out-File -FilePath "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week11\Class\iptables.bash"
