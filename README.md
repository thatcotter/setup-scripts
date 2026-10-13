# setup-scripts
Setup scripts for automating getting up and running with new machines


## MacOS
Clone this repo, then cd into the macOS folder using the terminal. From there, start the setup process by entering
```
bash ./0-macSetup.sh
```

[Setting up zsh with p10k](https://github.com/kasuskasus1/ohmyzsh_powerlevel10k)

[Vim Configuration](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)

## Windows
- clone this repo, then from an **admin** terminal run `powershell -ExecutionPolicy Bypass -File .\Windows\setup.ps1` (winget, debloat, apps)
- from a new **non-admin** terminal run `powershell -ExecutionPolicy Bypass -File .\Windows\scoop-setup.ps1`
- add `-Personal` to both commands on a personal machine to also install the non-work apps (games, torrents, etc.) and remove OneDrive
- Todo: add komorebi / whkd / yasb configs
- Todo: add steps for https://github.com/ChrisTitusTech/winutil

### Manual installs
Not available on winget or scoop:
- [ ] [TouchDesigner](https://derivative.ca/download)
- [ ] [Max](https://cycling74.com/downloads)
- [ ] [Ableton Live](https://www.ableton.com/en/account/) (installer is in your account)
- [ ] [VB-CABLE](https://vb-audio.com/Cable/)
- [ ] [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve)
- [ ] [Protokol](https://hexler.net/protokol)

## Linux TK
