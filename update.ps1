Import-Module au
Import-Module PowerShellForGitHub

$currentPath = (Split-Path $MyInvocation.MyCommand.Definition)
. $currentPath\helpers.ps1

$owner = 'LedgerHQ'
$repository = 'ledger-live'

function global:au_BeforeUpdate($Package) {
    $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.Url64 -Algorithm SHA512

    #Verify the integrity of the binary, following these instructions:
    #https://www.ledger.com/ledger-live/lld-signatures

    #Confirm integrity of the published checksums file
    Update-OpenSSLPublicKey -TagName $Latest.TagName
    Update-ChecksumFile -Version $Latest.SoftwareVersion
    Update-SignatureFile -Version $Latest.SoftwareVersion
    Confirm-Signature

    #Confirm integrity of installer binary
    $expectedChecksum = Get-ExpectedChecksum
    if ($Latest.Checksum64 -ne $expectedChecksum) {
        throw "Checksum verification failed!`n
        Expected: $expectedChecksum
        Actual: $($Latest.Checksum64)"
    }

    Set-DescriptionFromReadme -Package $Package -ReadmePath '.\DESCRIPTION.md'
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1'   = @{
            '(^[$]?\s*url64bit\s*=\s*)(''.*'')'   = "`$1'$($Latest.Url64)'"
            '(^[$]?\s*checksum64\s*=\s*)(''.*'')' = "`$1'$($Latest.Checksum64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            '(<packageSourceUrl>)[^<]*(</packageSourceUrl>)' = "`$1https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)`$2"
            '(<projectSourceUrl>)[^<]*(</projectSourceUrl>)' = "`$1https://github.com/$owner/$repository/tree/$($Latest.TagName)`$2"
            '(\*\*Release Notes:\*\* ).*$'                   = "`$1https://github.com/$owner/$repository/blob/$($Latest.TagName)/apps/ledger-live-desktop/RELEASE_NOTES.md"
            '(\*\*Full Changelog:\*\* ).*$'                  = "`$1https://github.com/$owner/$repository/releases/tag/$($Latest.TagName)"
            '(<copyright>)[^<]*(</copyright>)'               = "`$1Copyright © $(Get-Date -Format yyyy) Ledger Live Team`$2"
        }
    }
}

function global:au_GetLatest {
    $userAgent = 'Update checker of Chocolatey Community Package ''ledger-live'''
    $canonicalUri = 'https://download.live.ledger.com/latest/win'
    $headResponse = Invoke-WebRequest -Uri $canonicalUri -UserAgent $userAgent -Method Head -MaximumRedirection 1 -SkipHttpErrorCheck

    if ($null -ne $headResponse.BaseResponse.ResponseUri) {
        $redirectedRequestUri = $headResponse.BaseResponse.ResponseUri
    }
    elseif ($null -ne $headResponse.BaseResponse.RequestMessage.RequestUri) {
        $redirectedRequestUri = $headResponse.BaseResponse.RequestMessage.RequestUri
    }

    $servedVersion = (Get-Version -Version $redirectedRequestUri).Version

    $releases = Get-GitHubRelease -OwnerName $owner -RepositoryName $repository
    $latestRelease = $releases | Where-Object { $_.tag_name -match '@ledgerhq/live-desktop@\d\.(\d){1,2}\.\d' } | Select-Object -First 1
    $actualLatestVersion = [version] $latestRelease.tag_name.Substring(23)

    if ($servedVersion -lt $actualLatestVersion) {
        Write-Warning "A newer tag for Ledger Live Desktop was found (v$actualLatestVersion), but this build has not been published yet!"
    }

    return @{
        SoftwareVersion = $servedVersion
        TagName         = "%40ledgerhq/live-desktop%40$servedVersion"
        Url64           = "https://download.live.ledger.com/ledger-live-desktop-$servedVersion-win-x64.exe"
        Version         = $servedVersion #This may change if building a package fix version
    }
}

Update-Package -ChecksumFor None -NoReadme
