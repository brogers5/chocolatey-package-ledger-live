$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.91.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '82861c398bcfc8cd86de915bdab6bcd0aba4f4bbfbf9f8e47476216abe5fb6f15999b1680db0055163fc8330427ee0b55d1ea2995e1ebe13d0e4ce6627e4523d'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
