# git

# git add
function git-ad {
    git add $args
}

# git commit
function git-co {
    git commit $args
}

function git-co-am {
    git add .
    git commit -am $args
}

# git status
function git-st {
    git status $args
}

# git branch
function git-br {
    git branch $args
}

# git switch
function git-sw {
    git switch $args
}

# git push
function git-ps {
    git push $args
}

# git pull
function git-pl {
    git pull $args
}

# git fetch
function git-fe {
    git fetch $args
}

# git rebase
function git-rb-i {
    git rebase -i $args
}

function git-rb-a {
    git rebase --abort $args
}

function git-rb-c {
    git rebase --continue $args
}

# git merge
function git-mg {
    git merge $args
}

function git-rp {
    git remote prune $args
}

# git rebase
function git-rs {
    git reset $args
}

function git-rs-s {
    git reset --soft $args
}

function git-rs-h {
    git reset --hard $args
}

# git cherry-pick
function git-cp {
    git cherry-pick $args
}

function git-cp-a {
    git cherry-pick --abort $args
}

function git-cp-c {
    git cherry-pick --continue $args
}

function Get-Git-IsClean {
    $gitOutput = (git status --porcelain) | Out-String
    if ($gitOutput) {
        return $false
    }
    else {
        return $true
    }
}

function Get-Git-CurrentBranch {
    git symbolic-ref --quiet HEAD *> $null

    if ($LASTEXITCODE -eq 0) {
        return git rev-parse --abbrev-ref HEAD
    }
    else {
        return
    }
}
