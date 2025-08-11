$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.124.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '2fa97f251362ac5a97bcde0e857703162f3e29cf613db952d29d1602155b461bae96645ac84595826659486df1a6de83c8a9a4ba4db6113f62d205e7cbf634c9'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
