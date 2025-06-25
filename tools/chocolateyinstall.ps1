$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.118.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '9b599fbd27e707a3cafdda1f2f90164916ef0f89ac8a3b2e356674d0ab4237823f1902710f6289f782b63b9709b5a8e0d6096a21f265371ff38dc754583d3790'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
