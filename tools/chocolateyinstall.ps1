$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.98.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'ac935f04d8db1b9d76925e2633115c35c8139c96731f9b5319ec4831c9de1d68989fa022487b9850ac47392b1c6959110b3aec50b8f9e81fa03901a4fb1d3306'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
