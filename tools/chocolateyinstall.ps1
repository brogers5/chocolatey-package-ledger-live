$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.126.2-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'c122f74dfb77a25cc615906cfacfd8f867a1b49b0dcf0076ae65a843d831d0c3c9b4952b98a89a61311e58e202205d6d3ece687fb7d48ebcbd53935a366247d9'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
