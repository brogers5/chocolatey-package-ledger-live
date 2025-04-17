$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.109.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '727f2985b88072ee3654dccf98329d6ead42e21acf764c23fe22ed8f2dedc627a5726fd6e0e92a09c1c4d39262e0db905cf6802fa8475bfb66615cce953d7c1a'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
