$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.120.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '0168821311231c0c3236ac959812207f0c1f37a254e1ec8a0dc72c30cc00c89f25cff274f42d8a4f0e8fce17e57611251a217193b0c50c71cac038001217bfac'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
