$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.84.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '8d5392f248c5b1a7c4085334f9513620ca7879e3e9033fb06a0a4231cdb2e4f972cb556d1ce56b7e279ea35147288c4ded9623d65249adcdf0ed19ae220ab555'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
