$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.126.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '023e90075ccf4c954be0a7e2fe250fd28ee9fee905dcfad97b33a261b538585b142bca53eadea89ade5b078c2f2a50a440162916acd286635b18716bb197cb68'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
