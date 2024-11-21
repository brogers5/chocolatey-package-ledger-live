$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.92.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'a78147513fb6135707d69f22d490477e8057e3849977b06bb466388f071021bf391a6c4e2ccebae9475f4496681bb07b1eb4d70e9b849b36bdc5d99bf97916c4'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
