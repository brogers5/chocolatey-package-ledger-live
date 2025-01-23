$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.96.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '6e8f69aa42687be98215bcb8fe795ca81be65e2699a1af54cc20b05eab09b8858d43848b095cf10a698d48db660b8fe02fafd9703f15a0fec50300bf293dd9f0'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
