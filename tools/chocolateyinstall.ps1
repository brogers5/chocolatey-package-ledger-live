$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.113.2-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = '8fe5a1437f1590d105ac7912f440d1682bdd324a295cdf3efd6d6bd0ec2b0db9918fe56d147fd00d6ef6f1f481d678df4fd204f488cdfa435cd35b4f253d1880'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
