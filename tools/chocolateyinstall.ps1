$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.86.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '3c5b7e758fbac7f5fa3c441e43cbb8e7a35d5f8603d55373699019928c640293c21d815d506ae4b357f1454bdd41200013477cf222b7f140fb95f3d36707e966'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
