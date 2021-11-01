# Heng's Profile for PowerShell7

##############
# Modules
##############

Import-Module PSReadLine

$modulesPath = Join-Path -Path $PSScriptRoot -ChildPath "Modules"
$env:PSModulePath += ";$modulesPath"

# keymaps
. "$PSScriptRoot\keymaps.ps1"

# Z.lua
. "$PSScriptRoot\z.ps1"

# git
Import-Module -Name Git

################
# Functions
################

# Python 直接执行
# $env:PATHEXT += ";.py"

# 更新 pip 的方法
function Update-Packages {
    # update pip
    Write-Host "Step 1: 更新 pip" -ForegroundColor Magenta -BackgroundColor Cyan
    $a = pip list --outdated
    $num_package = $a.Length - 2
    for ($i = 0; $i -lt $num_package; $i++) {
        $tmp = ($a[2 + $i].Split(" "))[0]
        pip install -U $tmp
    }
}

####################
# Prompt
####################

function prompt {
    # User name
    Write-Host ("$env:UserName") -NoNewLine -ForegroundColor Magenta
    # $
	Write-Host ("$") -NoNewLine
    # Computer name
    Write-Host ("$env:COMPUTERNAME ") -NoNewLine -ForegroundColor Yellow
    # Location, shorten if path is too long.
    $path = (Get-Location).Path
    $parts = $path.Split("\")
    $length = $parts.Length
    if($length -gt 3)
    {
        $arr = @()
        $arr += $parts[0]
        for($i=1; $i -lt $length - 1; $i++) { $arr += ($parts[$i]).SubString(0,1)}
        $arr += $parts[$length - 1]
        $path = $arr -join "\"
    }
	Write-Host $path -NoNewLine -ForegroundColor Green
	Write-Host (" $") -NoNewLine

    return " "
}

###########
# Alias
###########
# 更新系统 os-update
Set-Alias -Name os-update -Value Update-Packages

# 查看目录 ls & ll
function ListDirectory {
    (Get-ChildItem).Name
    Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

