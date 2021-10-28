# git

function GitStatus { & git status $args }
New-Alias -Name git-st -Value GitStatus

function GitAllBranch { git branch -a }
New-Alias -Name git-ba -Value GitAllBranch

function GitSwitchBranch{
    param (
        $BranchName
    )
    git switch $BranchName
}
New-Alias -Name git-sb -Value GitSwitchBranch

function GitIsClean {
    $gitOutput = (git status --porcelain) | Out-String
    if ($gitOutput) {
        return $false
    } else {
        return $true
    }
}

function GitCurrentBranch {
    $gitOutput = (git status -s -b) | Out-String
    $gitOutput = $gitOutput.Split("...")[0]
    return -join $gitOutput[3 .. $gitOutput.Length]
}
