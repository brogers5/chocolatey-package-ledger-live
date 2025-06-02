$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.115.1-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'c6274cc9367ec3f2891a67683e6ebffaad237b3ba7c06de0772c60af6c7f73e052110420e481306e74900130bed347bf32c22e0922c82e8885d5a4f23ea0209d'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
