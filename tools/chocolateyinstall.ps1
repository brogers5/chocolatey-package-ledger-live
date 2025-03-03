$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.102.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '6a3bc20316024e4eb7c44bb7e98c7030c9233a200ac707fe0bfaaba0c669d4b431f289900357e07a673a6a71a8d145742e870abacd763e4553e4847b09d10ed5'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
