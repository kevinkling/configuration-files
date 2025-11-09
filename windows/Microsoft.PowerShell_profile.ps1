oh-my-posh init pwsh --config 'C:\Users\PC\AppData\Local\Programs\oh-my-posh\themes\bubblesline.omp.json' | Invoke-Expression

Import-Module Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Invoke-Expression (& { (zoxide init powershell | Out-String) })

function Get-GitStatus { & git status $args }
New-Alias -Name gss -Value Get-GitStatus
function Set-GitCommit { & git commit -am $args }
New-Alias -Name gcc -Value Set-GitCommit
function Set-GitPush { & git push }
New-Alias -Name gpp -Value Set-GitPush