$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.122.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '8f9a961837a803e672d4503ad59b674411e42ab813ed1e1857ada3a93008997ca76bb4ed4af05c0b4a623e8d6b56c66d19b1cb96463733c944fa76d5a2836fc8'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
