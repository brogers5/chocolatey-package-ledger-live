$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.131.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '6abd69b16ac5d4120cbc8f454620da8c015155dd081fe5d8fe046ea2c65633884c15b85e1f08d5149208ffaa5ef2b2bcd2f04c38c772e31619a3876b735a16a0'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
