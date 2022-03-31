# Get a list of running processes

# Get list of members

#Get-process | get-member

# Get a list of processes: name, id, path
# Can include "-object" if you want to or not does not matter. Just ignore message.

#Get-process | Select-object ProcessName, id, Path

# Save the Output to a CSV File

# Get-process | Select-object ProcessName, id, Path | Export-csv -Path `
# C:\Users\Asani-Web\Desktop\processes.csv

# Variable for file path
 $outputName = "C:\Users\Asani-Web\Desktop\Running_Services.csv"
# # System Services
# #Get-service | Get-Member
# Get-service | Select-object Status, Name, DisplayName, BinaryPathName | Export-csv -Path `
# $outputName

# Get a list of running services
#Get-service | Where-object { $_.Status -eq "Running" }

# Check to see if the file exists
if ( Test-path $outputName ) {

    write-host -backgroundcolor "Green" -foregroundcolor "white" "Services file was created!"

} else {

write-host -backgroundcolor "red" -foregroundcolor "white" "Services file was NOT created!"
}