#Set-ExecutionPolicy -ExecutionPolicy Unrestricted
# Install any Module with:
# Install-Module (Module you wish to install)

# Use 'Get-Command -Module (Module)' to find what commandlets came with the Module

# Get-Command -Module Posh-SSH

# Fix I found in to counter "New-SSHSession: Key exchange negotiation failed" message.
# Dont fully know what it means yet though.
## Didn't see you added this fix in the assignment ^

Get-SSHTrustedHost | Remove-SSHTrustedHost

#cls

#Login to a remote SSH server

#New-SSHSession -ComputerName '192.168.6.71' -Port 2222 -Credential (Get-Credential asani.vessup)

# "Get-SSHSession" allows you to see what workstations you are connected to and if you are actually
# Connected or not (True/False)

# "Remove-SSHSession -SessionId 0" closes SSHSession

<#
while ($True) {

    # Add a prompt to run commands

$CMD_Input = read-host -Prompt "Please enter a command "

# Run command on remote SSH server.

(Invoke-SSHCommand -index 0 $CMD_Input).Output

}

#>


Set-SCPItem -Computername '192.168.6.71' -Port 2222 -Credential (Get-Credential asani.vessup) `
-Destination '/home/asani.vessup' -Path '.\move.txt'