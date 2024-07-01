$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.83.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '00c47313656bcfdc5d6e0156a8d4d116f3e88708cec2f107f8a884b825ae11037dfd2aefcd9c3001343d7c4edda9e1b2714c7e1a1ec0d212febe71b2b435b81f'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
