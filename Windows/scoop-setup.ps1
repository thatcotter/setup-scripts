# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install scoop buckets
scoop bucket add extras
scoop bucket add games
scoop bucket add nerd-fonts

# Install desired programs using Scoop
$scoopApps = @(
    "7zip",
    "AnonymousPro-NF",
    "arduino",
    "blender",
    "bottom",
    "cmake",
    "curl",
    "deno",
    "epic-games-launcher",
    "docker",
    "ffmpeg",
    "git",
    "github",
    "godot",
    "helix",
    "jetbrains-toolbox"
    "lazydocker",
    "ntop",
    "nvm",
    "obsidian",
    "oh-my-posh",
    "openscad",
    "pandoc",
    "postman",
    "rustup",
    "slack",
    "vlc",
    "winfetch",
    "wiztree",
    "yt-dlp"
)

foreach ($app in $scoopApps) {
    scoop install $app
}
