$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.84.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'bcaa02485ace832ce5dbc5b5c662ebe0f77c665b04df011f1d01831e88d445ef2f9042fa850ddf55b441ab9d4ecc69f721da8154e9cffcfc0366a96d19fad789'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
