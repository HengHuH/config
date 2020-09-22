# boostrap for PowerShell7

# 已经安装过 git，RSA

# 1. 创建 ~/.local
if(!(Test-Path $HOME\.local)) {
    New-Item -Path $HOME -name .local -ItemType Directory
}
Set-Location $HOME\.local

if(!(Test-Path .\config))
{
    git clone git@github.com:HengHuH/config.git config
    Add-Content -Path $PROFILE -Value '.$HOME\.local\config\Init.ps1'
}
Set-Location .\config
if(!(Test-Path .\external))
{
    New-Item -Path config -Name external -ItemType Directory
}
Set-Location .\external
if(!(Test-Path .\z-lua))
{
    git clone git@github.com:skywind3000/z.lua.git z-lua
}

