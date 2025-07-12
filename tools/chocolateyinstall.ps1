$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.120.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'c52f7629ade528169f67e58390327d7ef44eea6e899edd9acdc36eff7839d41bff845d1216a47f8e3dded682a431905a77991de7142e88ccd0677381c2e931b2'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
