$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.107.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '0799d348b93032b17f063154e0b61d533a466cc8dac39aa53e4f9304edb8e5881435f2d3c211aa52c03405f7b6b9c3738180657f085b3148a85d17bb57c1f7bb'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
