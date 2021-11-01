# git add
function git_ad {
    git add $args
}

# git commit
function git_co {
    git commit $args
}

function git_co_am {
    git add .
    git commit -am $args
}

# git status
function git_st {
    git status $args
}

# git branch
function git_br {
    git branch $args
}

# git switch
function git_sw {
    git switch $args
}

# git push
function git_ps {
    git push $args
}

# git pull
function git_pl {
    git pull $args
}

# git fetch
function git_fe {
    git fetch $args
}

# git rebase
function git_rb_i {
    git rebase -i $args
}

function git_rb_a {
    git rebase --abort $args
}

function git_rb_c {
    git rebase --continue $args
}

# git merge
function git_mg {
    git merge $args
}

function git_rp {
    git remote prune $args
}

# git rebase
function git_rs {
    git reset $args
}

function git_rs_s {
    git reset --soft $args
}

function git_rs_h {
    git reset --hard $args
}

# git cherry-pick
function git_cp {
    git cherry-pick $args
}

function git_cp_a {
    git cherry-pick --abort $args
}

function git_cp_c {
    git cherry-pick --continue $args
}

# git diff
function git_df {
    git diff $args
}

# git log
function git_lg {
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

# $functionsToExport = @(
    # 'git_lg'
# )
# Export-ModuleMember -Function $functionsToExport
