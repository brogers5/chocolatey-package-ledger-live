$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.87.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '2f02de4fe7c82623f4091bbbad365261ca3c0710790eff28e4f8d1da8d41ad76c67e6e4596facec0907081d037a7d29431397bf5248e7b950cffc206d3d98e36'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
