# ***************************************************************************
#
# Purpose: To remove specific default apps in windows 10. 
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



Write-Output "Uninstalling default apps"

$apps = @(

    # default Windows 10 apps

    "Microsoft.3DBuilder"

    "Microsoft.Appconnector"

    "Microsoft.BingFinance"

    "Microsoft.BingNews"

    "Microsoft.BingSports"

    "Microsoft.BingWeather"

    "Microsoft.FreshPaint"

    "Microsoft.Getstarted"

    "Microsoft.MicrosoftOfficeHub"

    "Microsoft.MicrosoftSolitaireCollection"

    "Microsoft.MicrosoftStickyNotes"

    "Microsoft.Office.OneNote"

    "Microsoft.OneConnect"

    "Microsoft.People"

    "Microsoft.SkypeApp"

    "Microsoft.Windows.Photos"

    "Microsoft.WindowsAlarms"

    "Microsoft.WindowsCalculator"

    "Microsoft.WindowsCamera"

    "Microsoft.WindowsMaps"

    "Microsoft.WindowsPhone"

    "Microsoft.WindowsSoundRecorder"

    "Microsoft.XboxApp"

    "Microsoft.ZuneMusic"

    "Microsoft.ZuneVideo"

    "microsoft.windowscommunicationsapps"

    "Microsoft.MinecraftUWP"

    "Microsoft.CommsPhone"

    "Microsoft.ConnectivityStore"

    "Microsoft.Messaging"

    "Microsoft.Office.Sway"

    "Microsoft.OneConnect"

    "Microsoft.WindowsFeedbackHub"

    "Microsoft.BingFoodAndDrink"

    "Microsoft.BingTravel"

    "Microsoft.BingHealthAndFitness"

    "Microsoft.WindowsReadingList"
             
    "Microsoft.NetworkSpeedTest"

    "Microsoft.MicrosoftPowerBIForWindows"

    "Microsoft.RemoteDesktop"

    "Microsoft.Microsoft3DViewer"

    "Microsoft.Wallet"

    "Microsoft.XboxGameOverlay"

    "Microsoft.MSPaint"

    "Microsoft.Print3D"

    "Microsoft.GetHelp"

    " Microsoft.MixedReality.Portal"

    "Microsoft.XboxGamingOverlay"

    "Microsoft.YourPhone"

    "Microsoft.549981C3F5F10" #Cortana App

    # non-Microsoft




    # apps which cannot be removed using Remove-AppxPackage

    #"Microsoft.BioEnrollment"

    #"Microsoft.MicrosoftEdge"

    #"Microsoft.Windows.Cortana"

    #"Microsoft.WindowsFeedback"

    #"Microsoft.XboxGameCallableUI"

    #"Microsoft.XboxIdentityProvider"

    #"Windows.ContactSupport"

)



foreach ($app in $apps) {

    Write-Output "Trying to remove $app"



    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage



    Get-AppXProvisionedPackage -Online |

        Where-Object DisplayName -EQ $app |

        Remove-AppxProvisionedPackage -Online

}


   
