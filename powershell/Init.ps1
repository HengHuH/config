# Heng's Profile for PowerShell7

##############
# Modules
##############

Import-Module PSReadLine

# keymaps
. "$PSScriptRoot\keymaps.ps1"

# Z.lua
. "$PSScriptRoot\z.ps1"

# git
. "$PSScriptRoot\git.ps1"

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

    # update TeX Live
    $CurrentYear = Get-Date -Format yyyy
    Write-Host "Step 2: 更新 TeX Live" $CurrentYear -ForegroundColor Magenta -BackgroundColor Cyan
    tlmgr update --self
    tlmgr update --all
}

####################
# Prompt
####################

function prompt {
    # $color = Get-Random -Min 1 -Max 16
    Write-Host ("$env:UserName") -NoNewLine -ForegroundColor Magenta
	Write-Host ("$") -NoNewLine
    Write-Host ("$env:COMPUTERNAME ") -NoNewLine -ForegroundColor Yellow
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
# 1. 编译函数 make
function MakeThings {
    nmake.exe $args -nologo
}
Set-Alias -Name make -Value MakeThings

# 2. 更新系统 os-update
Set-Alias -Name os-update -Value Update-Packages

# 3. 查看目录 ls & ll
function ListDirectory {
    (Get-ChildItem).Name
    Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

