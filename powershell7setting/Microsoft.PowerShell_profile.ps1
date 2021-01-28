<#
 * FileName: Microsoft.PowerShell_profile.ps1
 * Author: Changyuw
 * Email: littleNewton6@outlook.com
 * Date: 2020, May. 1
 * Copyright: No copyright. You can use this code for anything with no warranty.
#>


#------------------------------- Import Modules BEGIN -------------------------------
# 引入 posh-git
Import-Module posh-git

# 引入 oh-my-posh
Import-Module oh-my-posh

# 设置 PowerShell 主题
Set-Theme Paradox
#------------------------------- Import Modules END   -------------------------------





#-------------------------------  Set Hot-keys BEGIN  -------------------------------
# 设置 Tab 键补全
# Set-PSReadlineKeyHandler -Key Tab -Function Complete

# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 向光标后删除一个字
Set-PSReadlineKeyHandler -Key "Ctrl+u" -Function DeleteChar

# 设置 Ctrl+d 
Set-PSReadlineKeyHandler -Key "Ctrl+d" -Function DeleteChar

# 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward

# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward

# 設定按下 Ctrl+b 光标向后移动一个字
Set-PSReadlineKeyHandler -Chord ctrl+b -Function BackwardChar

# 設定按下 Ctrl+f 光标向前移动一个字
Set-PSReadlineKeyHandler -Chord ctrl+f -Function ForwardChar

# 設定按下 Alt+b 光标向后移动一个词
Set-PSReadlineKeyHandler -Chord alt+b -Function BackwardWord

# 設定按下 Alt+f 光标向前移动一个词
Set-PSReadlineKeyHandler -Chord alt+f -Function ForwardWord


# 設定按下 Ctrl+e 可以移動游標到最後面(End)
Set-PSReadlineKeyHandler -Chord ctrl+e -Function EndOfLine

# 設定按下 Ctrl+a 可以移動游標到最前面(Begin)
Set-PSReadlineKeyHandler -Chord ctrl+a -Function BeginningOfLine

#
#-------------------------------  Set Hot-keys END    -------------------------------





#-------------------------------    Functions BEGIN   -------------------------------
# Python 直接执行
$env:PATHEXT += ";.py"

# 更新 pip 的方法
function Update-Packages {
    # update pip
    Write-Host "Step 1: 更新 pip" -ForegroundColor Magenta -BackgroundColor Cyan
    $a = pip list --outdated
    $num_package = $a.Length - 2
    for ($i = 0; $i -lt $num_package; $i++) {
        $tmp = ($a[2 + $i].Split(" "))[0]
        pip install -U $tmp
    }

    # update TeX Live
    $CurrentYear = Get-Date -Format yyyy
    Write-Host "Step 2: 更新 TeX Live" $CurrentYear -ForegroundColor Magenta -BackgroundColor Cyan
    tlmgr update --self
    tlmgr update --all
}
#-------------------------------    Functions END     -------------------------------





#-------------------------------   Set Alias Begin    -------------------------------
# 1. 编译函数 make
function MakeThings {
    nmake.exe $args -nologo
}
Set-Alias -Name make -Value MakeThings

# 2. 更新系统 os-update
Set-Alias -Name os-update -Value Update-Packages

# 3. 查看目录 ls & ll
function ListDirectory {
    (Get-ChildItem).Name
    Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name vi -Value vim
#-------------------------------    Set Alias END     -------------------------------

#-------------------------------   Set EvnValue Begin    -------------------------------
$GOPATH="G:\Go"
#-------------------------------    Set Alias END     -------------------------------
