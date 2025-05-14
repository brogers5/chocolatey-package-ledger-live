$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.113.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '9259be10a881a5be0e4e27df5557be42989389d34a5c7f055b40330da807924e77973f55e21b0d140f5a2a87002758b188819aeece6da51e50bbbd3575742649'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
