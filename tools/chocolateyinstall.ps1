$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.106.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '1590bc0968803aa2d53e0857ee182efb4dc92cac02b21cc215f9a81a8ff463d494173dcf789a959ff5418961d6c83d3734d8f5f9abbcfa4ea9a2e2a9e733b67e'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
