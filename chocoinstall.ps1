$chkChoco = 'C:\ProgramData\chocolatey'
$chkBrave = 'C:\Users\abjor\AppData\Local\BraveSoftware'
$chkDiscord = 'C:\Users\abjor\AppData\Local\Discord'
$chkEpic = 'C:\Program Files (x86)\Epic Games'
$chkFaceIT = 'C:\Users\abjor\AppData\Local\FACEITApp'
$chkOrigin = 'C:\Program Files (x86)\Origin\Origin.exe'
$chkVPN = 'C:\Program Files (x86)\Proton Technologies\ProtonVPN'
$chkFences = 'C:\Program Files (x86)\Stardock\Fences'
$chkSteam = 'C:\Program Files (x86)\Steam\'
$chkUplay = 'C:\Program Files (x86)\Ubisoft\'
$allPKG = $chkBrave, $chkDiscord, $chkEpic, $chkFaceIT, $chkOrigin, $chkVPN, $chkFences,$chkSteam ,$chkUplay 
$evalPKG = Test-Path $allPKG
$evalChoco = Test-Path $chkChoco
$pkgInstall = 'brave', 'discord', 'epicgameslauncher', 'Faceit', 'origin', 'protonvpn','stardock-fences','steam', 'uplay'
$i = 0

function Install-Chocolatey {
  if ($evalChoco -eq $true){
      Write-Host "Chocolatey is installed." 
      Install-Apps
  }
  elseif ($evalChoco -eq $false) {
      Write-Host "Chocolatey is not installed... Running chocolatey install script."
      Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  }
    
}
function Install-Apps {
  foreach ($pkgName in $pkgInstall){
    if($pkgName -eq $pkgInstall[$i] -And $evalPKG[$i] -eq $true) {
      $pkgName+" is installed."
      $i++
    }
    else {
        choco install $pkgName -y
        $i++
    }



  }
}
