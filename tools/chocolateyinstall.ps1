$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.130.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '30558a763cff630e856c2626dd2f15d71fce6dffd2066f0bcb13f0ea5a07604c89c1c58aec0df2504425f67cb3ea88c748ef88db3d9e9643cfded98693de470b'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
