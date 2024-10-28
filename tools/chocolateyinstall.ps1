$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://download.live.ledger.com/ledger-live-desktop-2.91.0-win-x64.exe'
  softwareName   = 'Ledger Live *'
  checksum64     = 'b47389325eedd30cc75be4606ba32046ec413abce1bfa2188be5960e18c2f22eedac54fb33077557faeb2a5dd18e1e827940131551bb5030ff8aeee246f4dc0c'
  checksumType64 = 'sha512'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
