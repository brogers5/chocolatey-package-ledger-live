$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.113.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'ff628dccdad72bb3280ae901904b862a6fedcad5c035b80d1e7015d9e4952ec9dd72d5e118dd7b40663213f43aee97e65239ddedc3386f40e4b5db69c8b021ff'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
