# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Add scoop buckets
$buckets = @(
    "extras",
    "games",
    "nerd-fonts",
    "nonportable"
)

foreach($bucket in $buckets) {
    scoop bucket add $bucket
}


# Install desired programs using Scoop
$scoopApps = @(
    "7zip",
    "AnonymousPro-NF",
    "arduino",
    "blender",
    "bottom",
    "bugn",
    "cmake",
    "curl",
    "deno",
    "epic-games-launcher",
    "docker",
    "ffmpeg",
    "git",
    "github",
    "godot",
    "handbrake",
    "helix",
    "jetbrains-toolbox",
    "lazydocker",
    "ntop",
    "nvm",
    "obs-studio",
    "obsidian",
    "oh-my-posh",
    "openscad",
    "pandoc",
    "postman",
    "rustup",
    "slack",
    "vlc",
    "vscode",
    "winfetch",
    "wiztree",
    "yt-dlp"
)

foreach ($app in $scoopApps) {
    scoop install $app
}
