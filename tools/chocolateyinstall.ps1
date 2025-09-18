$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.128.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '1b925c8cfe486b557ccf0c3f6ba21d73430c4825a00e9a4e6b845ab52c50b12037d4a4e4f93076064339a0cea6859f329ebbb161d3d46405ee11b5049f46cd3d'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
