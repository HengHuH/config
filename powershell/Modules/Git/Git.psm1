# git add
function gitad {
    git add $args
}

# git commit
function gitco {
    git commit $args
}

function gitcoam {
    git add .
    git commit -am $args
}

# git status
function gitst {
    git status $args
}

# git branch
function gitbr {
    git branch $args
}

# git switch
function gitsw {
    git switch $args
}

# git push
function gitps {
    git push $args
}

# git pull
function gitpl {
    git pull $args
}

# git fetch
function gitfe {
    git fetch $args
}

# git rebase
function gitrbi {
    git rebase -i $args
}

function gitrba {
    git rebase --abort $args
}

function gitrbc {
    git rebase --continue $args
}

# git merge
function gitmg {
    git merge $args
}

function gitrp {
    git remote prune $args
}

# git rebase
function gitrs {
    git reset $args
}

function gitrss {
    git reset --soft $args
}

function gitrsh {
    git reset --hard $args
}

# git cherry-pick
function gitcp {
    git cherry-pick $args
}

function gitcpa {
    git cherry-pick --abort $args
}

function gitcpc {
    git cherry-pick --continue $args
}

# git diff
function gitdf {
    git diff $args
}

# git log
function gitlg {
    git log $args
}

function Get-GitIsClean {
    $gitOutput = (git status --porcelain) | Out-String
    if ($gitOutput) {
        return $false
    }
    else {
        return $true
    }
}

function Get-GitCurrentBranch {
    git symbolic-ref --quiet HEAD *> $null

    if ($LASTEXITCODE -eq 0) {
        return git rev-parse --abbrev-ref HEAD
    }
    else {
        return
    }
}
