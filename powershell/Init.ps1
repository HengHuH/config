# Heng's Profile for PowerShell7

#------------------------------- Import Modules BEGIN -------------------------------

Import-Module PSReadLine

#------------------------------- Import Modules END   -------------------------------


#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置 Tab 键补全
# Set-PSReadlineKeyHandler -Key Tab -Function Complete

# 设置 Ctrl+d 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 为退出 PowerShell
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function ViExit

# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
#-------------------------------  Set Hot-keys END    -------------------------------



#-------------------------------    Functions BEGIN   -------------------------------
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

#-------------------------------    Functions END     -------------------------------
# Prompt

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

iex ($(lua $HOME\.local\config\external\z-lua\z.lua --init powershell) -join "`n") 

#-------------------------------   Set Alias Begin    -------------------------------
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

# git
function GitStatus { & git status $args }
New-Alias -Name gst -Value GitStatus

function GitAllBranch { git branch -a }
New-Alias -Name gba -Value GitAllBranch

function GitSwitchBranch{
    param (
        $BranchName
    )
    git switch $BranchName
}
New-Alias -Name gsb -Value GitSwitchBranch

function GitSwitchNewBranch($BranchName) { git switch -c $BranchName}
New-Alias -Name gsnb -Value GitSwitchNewBranch

function GitCommitAllMessage ([string]$Message)
{
    git add .
    git commit -m $Message
}
New-Alias -Name gcam -Value GitCommitAllMessage

function GitRebaseMaster { git rebase -i master }
New-Alias -Name grm -Value GitRebaseMaster

function GitPushOriginBranch ($BranchName){ git push origin $BranchName }
New-Alias -Name gpob -Value GitPushOriginBranch

function GitFetchUpstream { git fetch upstream }
New-Alias -Name gfu -Value GitFetchUpstream

function GitPush { git push }
New-Alias -Name gph -Value GitPush

# z.lua

# 快速回到父目录
function ZLuaBackRoot { z -b }
New-Alias -Name zb -Value ZLuaBackRoot

# 选择最近去的地方
# function ZLuaLast { z -I -t }
# New-Alias -Name zh -Value ZLuaLast

# 严格匹配当前路径的子路径
function ZLuaSubDirectory {& z -c $args}
New-Alias -Name zz -Value ZLuaSubDirectory

# 使用交互式选择模式
function ZLuaInteractive {& z -i $args }
New-Alias -Name zi -Value ZLuaInteractive

# 使用 fzf 对多个结果进行选择
# function ZLuaRecent { z -I }
# New-Alias -Name zf -Value ZLuaRecent

#-------------------------------    Set Alias END     -------------------------------
