$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.81.2-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '50100675af59034fc422387e8feb82d34693c474b5565b57a757d0dcc70f9771d64e44feec712c08994d0f5086f3e22743428d429e28969f73bacfb92e1ddf61'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
