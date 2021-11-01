# git add
function gitad {
    git add $args
}

# git commit
function gitcm {
    git commit $args
}

function gitcmam {
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

function gitbrr {
    git branch -r
}

function gitbra {
    git branch -a
}

# git switch
function gitsw {
    git switch $args
}

function gitswn {
    git switch -c $args
}

# git push
function gitps {
    git push $args
}

function gitpsob {
    $currentBranch = Get-GitCurrentBranch
    git push origin $currentBranch
}

# git pull
function gitpl {
    git pull $args
}

# git fetch
function gitft {
    git fetch $args
}

function gitfto {
    git fetch origin $args
}

function gitftu {
    git fetch upstream $args
}

# git rebase
function gitrbi {
    git rebase -i $args
}

function gitrbm {
    git rebase -i master
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

function gitmgum {
    git merge upstream/master $args
}

function gitmga {
    git merge --abort $args
}

function gitmgc {
    git merge --continue $args
}

# git remote
function gitrmp {
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

# git stash
function gitss {
    git stash $args
}

function gitssp {
    git stash pop
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
