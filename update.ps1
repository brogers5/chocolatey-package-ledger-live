Import-Module au

function global:au_BeforeUpdate($Package) {
    Set-DescriptionFromReadme -Package $Package -ReadmePath '.\DESCRIPTION.md'
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            '(<packageSourceUrl>)[^<]*(</packageSourceUrl>)' = "`$1https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)`$2"
        }
    }
}

function global:au_GetLatest {
    return @{
        Version = '2.132.0'
    }
}

Update-Package -ChecksumFor None -NoReadme -NoCheckUrl
