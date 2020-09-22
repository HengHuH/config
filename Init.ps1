# Heng's Profile for PowerShell7

# Prompt

function prompt {
    $color = Get-Random -Min 1 -Max 16
    Write-Host ("$env:UserName@$env:COMPUTERNAME " + $(Get-Location) +" $") -NoNewLine `
     -ForegroundColor $Color
    return " "
}
