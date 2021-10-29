# git

function git-ad {
    git add $args
}

function git-co {
    git commit $args
}

function git-co-am {
    git commit -am $args
}

function git-st {
    git status $args
}

function git-br {
    git branch $args
}

function git-sw {
    git switch $args
}

function git-ph {
    git push $args
}

function git-pl {
    git pull $args
}

function git-fe {
    git fetch $args
}

function git-rbi {
    git rebase -i $args
}

function git-rba {
    git rebase --abort $args
}

function git-rbc {
    git rebase --continue $args
}

function git-mg {
    git merge $args
}

function git-rp {
    git remote prune $args
}

function Get-Git-IsClean {
    $gitOutput = (git status --porcelain) | Out-String
    if ($gitOutput) {
        return $false
    } else {
        return $true
    }
}

function Get-Git-CurrentBranch {
    git symbolic-ref --quiet HEAD *> $null

    if ($LASTEXITCODE -eq 0) {
        return git rev-parse --abbrev-ref HEAD
    } else {
        return
    }
}
