# Usage: .\scoop-setup.ps1 [-Personal]   (-Personal adds the non-work apps)
# Run from a non-admin terminal, after setup.ps1
param([switch]$Personal)

# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# git is needed for buckets, aria2 speeds up downloads
scoop install git aria2

# Add scoop buckets
foreach ($bucket in "extras", "nerd-fonts", "sysinternals") {
    scoop bucket add $bucket
}
scoop bucket add charm https://github.com/charmbracelet/scoop-bucket.git

$scoopApps = @(
    # Dev / CLI
    "7zip",
    "bottom",
    "cmake",
    "crush",
    "curl",
    "deno",
    "ffmpeg",
    "flyctl",
    "go",
    "helix",
    "lazydocker",
    "ntop",
    "nvm",
    "oh-my-posh",
    "pandoc",
    "pi-coding-agent",
    "pipx",
    "pnpm",
    "pwsh",
    "python",
    "rustup",
    "scoop-search",
    "speedtest-cli",
    "winfetch",
    "yt-dlp",

    # Editors / dev GUI
    "cursor",
    "github",
    "jetbrains-toolbox",
    "postman",
    "vscode",
    "winmerge",
    "zed",

    # Creative / AV
    "audacity",
    "blender",
    "darktable",
    "figma",
    "freecad",
    "godot",
    "handbrake",
    "instant-eyedropper",
    "lamexp",
    "mpv",
    "obs-studio",
    "ollama-full",
    "openscad",
    "openshot",
    "picpick",
    "vlc",

    # Fabrication / hardware
    "arduino",
    "avrdude",
    "avrdudess",
    "cura",
    "etcher",
    "prusaslicer",
    "rufus",

    # Productivity / comms
    "everything",
    "espanso",
    "flow-launcher",
    "libreoffice",
    "notion",
    "obsidian",
    "powertoys",
    "process-explorer",
    "slack",
    "sumatrapdf",
    "typora",
    "wiztree",
    "zoom",

    # Desktop / fonts
    "AnonymousPro-NF",
    "FiraCode",
    "komorebi",
    "whkd",
    "yasb"
)

$personalScoopApps = @(
    "anki",
    "brave",
    "crystaldiskmark",
    "discord",
    "gallery-dl",
    "hwmonitor",
    "legcord",
    "librehardwaremonitor",
    "nilesoft-shell",
    "playnite",
    "qbittorrent",
    "seelen-ui",
    "signal",
    "soulseekqt",
    "sunshine",
    "transmission",
    "ungoogled-chromium",
    "vial",
    "https://raw.githubusercontent.com/aandrew-me/ytDownloader/main/ytdownloader.json"
)

if ($Personal) { $scoopApps += $personalScoopApps }

scoop install @scoopApps
