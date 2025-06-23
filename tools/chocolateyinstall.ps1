$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.118.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '7e7a857fe5af6878ae143a4517d6d5438e3aab478d5ac2b3720479a405d96ad65a58b3ce9f4fc44e62767a2fbb92b3eb288be78a3ac6d67f559e66e0cdb1a0db'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
