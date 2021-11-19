# Config

HengHuH's Persional shell configs，using Powershell on Windows，zsh on Linux or Mac.

## Dependency

git, RSA, lua, python

## Initialization

```
cd $HOME  
mkdir .local && cd .local  
git clone git@github.com:HengHuH/config.git config
```
### PowerShell

vim $PROFILE
APPEND: .\$HOME/.local/config/powershell/Init.ps1

### MacOS or Linux

使用 zsh  
修改 ~/.zshrc，添加  %HOME%/.local/config/zsh/init.sh
