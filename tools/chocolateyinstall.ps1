$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.104.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'b64f59cbae4fdbdb17b6263c30e78fbed65e0c49b917b9357840958de02cc19737ebc8e6c48ae1b59af7adf73870d124206362d2bf17639c5529c2deef3821bf'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
