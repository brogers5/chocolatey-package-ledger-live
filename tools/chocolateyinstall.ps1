$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.94.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '48bf5f83fe2826ac2d8bfbc1e92377ed85bcc37270d966dd2a3b11596d8128c58a572b4c63f00d872dcb67335ceade8c6dd4b78eab0eace3f2da74e3823b4f6d'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
