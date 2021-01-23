$chkChoco = 'C:\ProgramData\chocolatey'
$chkDiscord = "C:\Users\$env:username\AppData\Local\Discord"
$chkEpic = 'C:\Program Files (x86)\Epic Games'
$chkOrigin = 'C:\Program Files (x86)\Origin\'
$chkSteam = 'C:\Program Files (x86)\Steam\'
$chkUplay = 'C:\Program Files (x86)\Ubisoft\'
$allPKG = $chkDiscord, $chkEpic, $chkOrigin, $chkSteam , $chkUplay 
$evalPKG = Test-Path $allPKG
$evalChoco = Test-Path $chkChoco
$pkgInstall = 'discord', 'epicgameslauncher', 'origin', 'steam', 'uplay'
$i = 0
<#
.DESCRIPTION
Searches for applications and if they are not found chocolatey runs and installs them automatically.
 #>
if ($evalChoco -eq $false) {
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}  

foreach ($pkgName in $pkgInstall) {
  if ($pkgName -eq $pkgInstall[$i] -And $evalPKG[$i] -eq $true) {
    $pkgName + " is installed."
    $i++
  }
  else {
    choco install $pkgName -y
    $i++
  }
}
