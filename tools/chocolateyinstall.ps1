$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.89.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '558a803d51e7a94783d2f5910b260dc5ccba39f8db5dcf314cf067650d4d7d175e265cffa9c713130e45a2271a3727217537f9ce0ead78f1d0ac02ba9f34db67'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
