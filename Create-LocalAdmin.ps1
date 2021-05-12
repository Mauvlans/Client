<# ***************************************************************************
#
# Purpose: Create Local Admin with 
#
# ------------- DISCLAIMER -------------------------------------------------
# This script code is provided as is with no guarantee or waranty concerning
# the usability or impact on systems and may be used, distributed, and
# modified in any way provided the parties agree and acknowledge the 
# Microsoft or Microsoft Partners have neither accountabilty or 
# responsibility for results produced by use of this script.
#
# Microsoft will not provide any support through any means.
# ------------- DISCLAIMER -------------------------------------------------
#
# ***************************************************************************
#>

# The Steps Below should be run to Generate a Password Hash file to be added to the OSD PPKG
#$Credentials = Get-Credential
#$Credentials.Password | ConvertFrom-SecureString | Set-Content password.txt
 
# PreDefined User and Password
$NewLocalAdmin = "GenAdmin"
$Password = Get-Content .\password.txt | ConvertTo-SecureString

# Ask for User and Password
#$NewLocalAdmin = Read-Host "New local admin username:"
#$Password = Read-Host -AsSecureString "Create a password for $NewLocalAdmin"

function CreateNewLocalAdmin {
    [CmdletBinding()]
    param (
        [string] $NewLocalAdmin,
        [securestring] $Password
    )    
    begin {
    }    
    process {
        New-LocalUser "$NewLocalAdmin" -Password $Password -FullName "$NewLocalAdmin" -Description "Local admin"
        Write-Verbose "$NewLocalAdmin local user crated"
        Add-LocalGroupMember -Group "Administrators" -Member "$NewLocalAdmin"
        Write-Verbose "$NewLocalAdmin added to the local administrator group"
    }    
    end {
    }
}

CreateNewLocalAdmin -NewLocalAdmin $NewLocalAdmin -Password $Password -Verbose