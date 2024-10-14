$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.89.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '5fc1d9d870c303fa8cdc9be6d97040884ccb436ee1e0fd20d240cf0427e33dad87bd5086f85abdc37f564cb0ef0ddc930441525b0a705d227aa19f6a148ef4b3'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
