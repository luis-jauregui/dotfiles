# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
oh-my-posh --init --shell pwsh --config $env:USERPROFILE\AppData\Local\nvim\.powershell\luis.omp.json | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Alias
Set-Alias c clear
Set-Alias v nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias lazy lazygit
Set-Alias touch New-Item
Set-Alias grep findstr
Set-Alias get Get-InstalledModule
Set-Alias clean Uninstall-Module
Set-Alias remove Remove-Module

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
       	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
