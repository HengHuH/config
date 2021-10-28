# z.lua

Invoke-Expression ($(lua $HOME\.local\z-lua\z.lua --init powershell) -join "`n") 

# 快速回到父目录
function ZLuaBackRoot { z -b }
New-Alias -Name zb -Value ZLuaBackRoot

# 选择最近去的地方
function ZLuaLast { z -I -t }
New-Alias -Name zh -Value ZLuaLast

# 严格匹配当前路径的子路径
function ZLuaSubDirectory {& z -c $args}
New-Alias -Name zz -Value ZLuaSubDirectory

# 使用交互式选择模式
function ZLuaInteractive {& z -i $args }
New-Alias -Name zi -Value ZLuaInteractive

# 使用 fzf 对多个结果进行选择
# function ZLuaRecent { z -I }
# New-Alias -Name zf -Value ZLuaRecent