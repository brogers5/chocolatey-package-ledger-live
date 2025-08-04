$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.122.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'f2465a79671ee6c9e5586e055d91c85249cf883570a7634b7db64e9f9e6072f0d3d422358405bbfa8f1579687e15ba57daf2c44de9bfcb29ee99bc97b97f9e4b'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
