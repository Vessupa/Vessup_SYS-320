# Send an email using Powershell

$toSend = @('ornateshelf5097@gmail.com', 'asani.vessup@mymail.champlain.edu')

# Message body

# $___ is how you make powershell variables

$msg = "Hello"

while ($true) {
    foreach ($email in $toSend) {

        # Send the email
        write-host "Send-MailMessage -from 'asani.vessup@mymail.champlain.edu' -To $email - Subject 'Test Email from Powershell' `
        -Body $msg -SmtpServer X.X.X.X"

        # Pause for 1 second
        # start-sleep 1

    }
}