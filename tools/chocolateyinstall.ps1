$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.131.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'f63f6de439ca792d06e3ecbb5bea20c695ff9ed05770d9fec5535f560d0d092a416a5cf6b7a8a5e0660b34b71381225adc1d6fb759ea4bc1cd6e74e718294441'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
