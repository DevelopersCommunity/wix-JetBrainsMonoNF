$ErrorActionPreference = 'Stop'

(gh release view -R ryanoasis/nerd-fonts --json assets) `
    -match '(?<url>https://[^"]+?JetBrainsMono\.zip)"'
$asset = $Matches.url

Invoke-WebRequest -Uri $asset -OutFile $PSScriptRoot\JetBrainsMono.zip
Remove-Item `
    -Path $PSScriptRoot\Fonts `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue
New-Item `
    -Path $PSScriptRoot\Fonts `
    -ItemType Directory
Expand-Archive `
    -Path $PSScriptRoot\JetBrainsMono.zip `
    -DestinationPath $PSScriptRoot\Fonts `
    -Force
Remove-Item `
    -Path $PSScriptRoot\Fonts\* `
    -Exclude *.ttf

$asset -match '/v(?<version>[\d.]+)/'
$version = $Matches.version

(Get-Content -Path $PSScriptRoot\Package.xml) `
    -creplace '(\bVersion=)"[\d.]+"', ('$1"' + $version + '"') `
    > $PSScriptRoot\Package.wxs

dotnet build -c Relese $PSScriptRoot\JetBrainsMono.wixproj
