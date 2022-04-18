# Delete main payload that contains malware

$delete_mal = @"
del step2.ps1
"@

# Create Update.bat file with $delete_mal code

$File_Path = "C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week12\Homework\"

$File_Write = $File_Path + "Update.bat"

$delete_mal | Out-File -FilePath $File_Write -Encoding ascii

# You have to encode the file with ascii in order to delete the step file for some reason. Very odd.

# Execute the Update.bat file

Start-Process -FilePath "Update.bat"