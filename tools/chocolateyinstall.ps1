$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.85.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '4d112e7e0616f633ab464267d808582c16f3d254660ac57f90302fa2e8ad3725bc0baff851a36b1082fc89183fb6823fb042c3fa0a04c86362ecbb985c896bf9'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
