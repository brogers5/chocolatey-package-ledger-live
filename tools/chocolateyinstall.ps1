$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.92.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '388369397e015517e4893465573e9950a990aef92a3ac3e94073513798825aad90406594d12ee91fa53b43c78476f79e16df93e5bd3cf7c0c095ecbad87c4653'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
