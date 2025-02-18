$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.100.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '01cc68c98a3d2d06f94408f40edf3bcc126e86ca2e48d28c1c8d2fe42bf9b36fe80a83b864d2b0ec6a885cce30279139028576ac967fd91504457d7544fb3bc8'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
