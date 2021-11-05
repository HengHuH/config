# git add
function GitAD {
    git add $args
}

# git commit
function GitCM {
    git commit $args
}

function GitCMam {
    git add .
    git commit -am $args
}

# git status
function GitST {
    git status $args
}

# git branch
function GitBR {
    git branch $args
}

function GitBRr {
    git branch -r
}

function GitBRa {
    git branch -a
}

# git switch
function GitSW {
    git switch $args
}

function GitSWn {
    git switch -c $args
}

# git push
function GitPS {
    git push $args
}

function GitPSob {
    $currentBranch = Get-GitCurrentBranch
    git push origin $currentBranch
}

# git pull
function GitPL {
    git pull $args
}

# git fetch
function GitFT {
    git fetch $args
}

function GitFTo {
    git fetch origin $args
}

function GitFTu {
    git fetch upstream $args
}

# git rebase
function GitRBi {
    git rebase -i $args
}

function GitRBm {
    git rebase -i master
}

function GitRBa {
    git rebase --abort $args
}

function GitRBc {
    git rebase --continue $args
}

# git merge
function GitMG {
    git merge $args
}

function GitMGum {
    git merge upstream/master $args
}

function GitMGa {
    git merge --abort $args
}

function GitMGc {
    git merge --continue $args
}

# git remote
function GitRMp {
    git remote prune $args
}

# git rebase
function GitRS {
    git reset $args
}

function GitRSs {
    git reset --soft $args
}

function GitRSh {
    git reset --hard $args
}

# git cherry-pick
function GitCP {
    git cherry-pick $args
}

function GitCPa {
    git cherry-pick --abort $args
}

function GitCPc {
    git cherry-pick --continue $args
}

# git diff
function GitDF {
    git diff $args
}

# git log
function GitLG {
    git log $args
}

# git stash
function GitSS {
    git stash $args
}

function GitSSp {
    git stash pop
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
