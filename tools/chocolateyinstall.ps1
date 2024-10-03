$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.87.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'e711fbf617cc056adb6a525657abc4ef1833feb7c0d31fe846d0a5e894fc1243e2a052665f179b982736ae4ff32726da3ead83e0d0686d7164d43b69f8c3003f'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
