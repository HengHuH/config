Heng's persional profiles, powershell, zsh

## Dependency

git, lua, python

## Initialization

```
cd $HOME

mkdir .local && cd .local

git clone git@github.com:HengHuH/config.git config
```
### Windows

Open PowerShell

vim $PROFILE

APPEND: .\$HOME/.local/config/powershell/Init.ps1

### MacOS or Linux

使用 zsh  
修改 ~/.zshrc，添加  %HOME%/.local/config/zsh/init.sh
