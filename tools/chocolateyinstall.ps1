$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.117.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'fc03362104dc6e22b016de849c37cd697fccfa7b5dc3e10130c95e55935e5eb2f3c4a82e9d8195d793170eb2392de764844902d31d3a4dc5b58982ce9df5df4b'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
