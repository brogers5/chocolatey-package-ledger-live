$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.111.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'e493bdc5bc3c60f0219f33a7ae631b232545a42a7519d1e409edf3f7eadcbbfb6e863aa6c99f7f39f89cc1d50379ef7ad5b77ab06de2d2512249fe70ba045b73'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
