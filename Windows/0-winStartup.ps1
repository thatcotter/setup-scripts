### Install WinGet ###
# Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppxPackage -Name 'Microsoft.Winget.Source' | Select Name, Version
$hasVCLibs = Get-AppxPackage -Name 'Microsoft.VCLibs.140.00.UWPDesktop' | Select Name, Version
$hasXAML = Get-AppxPackage -Name 'Microsoft.UI.Xaml.2.7*' | Select Name, Version
$hasAppInstaller = Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Select Name, Version
$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$errorlog = "winget_error.log"


function installWingetApps {
    # run winget to install apps available on the windows marketplace
    winget import --import-file "winstall.json"
}


### Finished ###
function finish {
    Write-Host
    Write-Host -ForegroundColor Magenta  "Installation finished"
    Write-Host
    Pause
}

### Question what to do ###
function menu {
    [string]$Title = 'Winget Menu'
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host
    Write-Host "1: Do all steps below"
    Write-Host
    Write-Host "2: Just install winget"
    Write-Host
    Write-Host "3: Install Apps"
    Write-Host "4: Remove bloatware"
    Write-Host
    Write-Host "5: Install Taskjob for automatic updates"
    Write-Host "6: Get List of all installed Apps"
    Write-Host
    Write-Host -ForegroundColor Magenta "0: Quit"
    Write-Host
    
    $actions = "0"
    while ($actions -notin "0..7") {
    $actions = Read-Host -Prompt 'What you want to do?'
        if ($actions -in 0..7) {
            if ($actions -eq 0) {
                exit
            }
            if ($actions -eq 1) {
                ./1-wingetInstall.ps1
                # install_gui
                # install_silent
                installWingetApps
                ./1-debloating.ps1
                taskjob
                finish
            }
            if ($actions -eq 2) {
                ./1-wingetInstall.ps1
                finish
            }
            if ($actions -eq 3) {
                ./1-wingetInstall.ps1
                # install_gui
                installWingetApps
                finish
            }
            if ($actions -eq 4) {
                debloating
                finish
            }
            if ($actions -eq 5) {
                taskjob
                finish
            }
            if ($actions -eq 6) {
                install_winget
                get_list
            }
            menu
        }
        else {
            menu
        }
    }
}
menu