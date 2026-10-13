# Usage: .\setup.ps1 [-Personal]   (-Personal adds the non-work apps)
param([switch]$Personal)
#Requires -RunAsAdministrator

### Install WinGet (preinstalled on Windows 11) ###
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Install-PackageProvider -Name NuGet -Force | Out-Null
    Install-Module Microsoft.WinGet.Client -Force -Repository PSGallery
    Repair-WinGetPackageManager -AllUsers
}

### Debloating ###
# Based on this gist: https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1
$bloatware = @(
    # default Windows 11 apps
    "MicrosoftTeams"
    "Microsoft.Todos"
    "Microsoft.PowerAutomateDesktop"

    # default Windows 10 apps
    "Microsoft.549981C3F5F10"        # Cortana Offline
    "Microsoft.3DBuilder"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    "Microsoft.FreshPaint"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.MinecraftUWP"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.OneNote"
    "Microsoft.People"
    "Microsoft.Print3D"    
    "Microsoft.WindowsAlarms"
    # "microsoft.windowscommunicationsapps"        # Mail and Calender     
    "Microsoft.WindowsMaps"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.ZuneVideo"
    "Microsoft.YourPhone"
    # "Microsoft.MSPaint"          # Paint & Paint3D
    # "Microsoft.ZuneMusic"        # New Media Player in Windows

    # Xbox Apps
    # "Microsoft.Xbox.TCUI"
    # "Microsoft.XboxApp"
    # "Microsoft.XboxGameOverlay"
    # "Microsoft.XboxGamingOverlay"
    # "Microsoft.XboxIdentityProvider"
    # "Microsoft.XboxSpeechToTextOverlay"

    # Threshold 2 apps
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"

    # Creators Update apps
    "Microsoft.Microsoft3DViewer"

    #Redstone apps
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.WindowsReadingList"

    # Redstone 5 apps
    "Microsoft.MixedReality.Portal"
    "Microsoft.Whiteboard"

    # non-Microsoft
    # "4DF9E0F8.Netflix"
    # "SpotifyAB.SpotifyMusic"
    "2FE3CB00.PicsArt-PhotoStudio"
    "46928bounde.EclipseManager"
    "613EBCEA.PolarrPhotoEditorAcademicEdition"
    "6Wunderkinder.Wunderlist"
    "7EE7776C.LinkedInforWindows"
    "89006A2E.AutodeskSketchBook"
    "9E2F88E3.Twitter"
    "A278AB0D.DisneyMagicKingdoms"
    "A278AB0D.MarchofEmpires"
    "ActiproSoftwareLLC.562882FEEB491"
    "CAF9E577.Plex"
    "ClearChannelRadioDigital.iHeartRadio"
    "D52A8D61.FarmVille2CountryEscape"
    "D5EA27B7.Duolingo-LearnLanguagesforFree"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "DolbyLaboratories.DolbyAccess"
    "Drawboard.DrawboardPDF"
    "Facebook.Facebook"
    "Fitbit.FitbitCoach"
    "Flipboard.Flipboard"
    "GAMELOFTSA.Asphalt8Airborne"
    "KeeperSecurityInc.Keeper"
    "NORDCURRENT.COOKINGFEVER"
    "PandoraMediaInc.29680B314EFC2"
    "Playtika.CaesarsSlotsFreeCasino"
    "ShazamEntertainmentLtd.Shazam"
    "SlingTVLLC.SlingTV"
    "TheNewYorkTimes.NYTCrossword"
    "ThumbmunkeysLtd.PhototasticCollage"
    "TuneIn.TuneInRadio"
    "WinZipComputing.WinZipUniversal"
    "XINGAG.XING"
    "flaregamesGmbH.RoyalRevolt2"
    "king.com.*"
);

$provisioned = Get-AppxProvisionedPackage -Online
foreach ($app in $bloatware) {
    Write-Host -ForegroundColor Red "Removing:" $app
    Get-AppxPackage -AllUsers $app | Remove-AppxPackage -AllUsers
    # Also remove the provisioned copy so it doesn't come back for new users
    $provisioned | Where-Object DisplayName -like $app | Remove-AppxProvisionedPackage -Online | Out-Null
}

### Install apps ###
# Most apps come from scoop (scoop-setup.ps1); these are the ones scoop doesn't carry
$wingetApps = @(
    "AgileBits.1Password",
    "Anthropic.Claude",
    "Adobe.CreativeCloud",
    "Canonical.Ubuntu",
    "Comfy.ComfyUI-Desktop",
    "Docker.DockerDesktop",
    "ElementLabs.LMStudio",
    "Elgato.StreamDeck",
    "GitHub.cli",
    "Google.Chrome",
    "Insta360.Link.Controller",
    "MichaelTippach.ASIO4ALL",
    "Microsoft.VisualStudio.2022.Community",
    "Mozilla.Firefox",
    "NDI.NDITools",
    "ogdesign.Eagle",
    "RaspberryPiFoundation.RaspberryPiImager",
    "SonicPi.SonicPi",
    "SuperCollider.SuperCollider",
    "Tailscale.Tailscale",
    "TobiasErichsen.loopMIDI",
    "Unity.UnityHub",
    "VCVRack.VCVRack"
)

$personalWingetApps = @(
    "Dropbox.Dropbox",
    "EpicGames.EpicGamesLauncher",
    "Google.GoogleDrive",
    "ImputNet.Helium",
    "TorProject.TorBrowser",
    "Valve.Steam",
    "Zen-Team.Zen-Browser"
)

if ($Personal) {
    $wingetApps += $personalWingetApps
    # OneDrive is a Win32 app, not an Appx package. Work laptops usually need it, so only remove it on personal machines
    winget uninstall --id Microsoft.OneDrive --silent --accept-source-agreements
}

foreach ($app in $wingetApps) {
    winget install --id $app --exact --silent --accept-package-agreements --accept-source-agreements
}

Write-Host -ForegroundColor Magenta "Done. Run scoop-setup.ps1 from a new, non-admin terminal, then work through the manual installs in the README."