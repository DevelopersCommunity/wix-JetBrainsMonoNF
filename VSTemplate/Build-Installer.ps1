$ErrorActionPreference = 'Stop'

(gh release view -R ryanoasis/nerd-fonts --json assets) `
    -match '(?<url>https://[^"]+?$safeprojectname$\.zip)"'
$asset = $Matches.url

Invoke-WebRequest -Uri $asset -OutFile $PSScriptRoot\$safeprojectname$.zip
Remove-Item `
    -Path $PSScriptRoot\Fonts `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue
New-Item `
    -Path $PSScriptRoot\Fonts `
    -ItemType Directory
Expand-Archive `
    -Path $PSScriptRoot\$safeprojectname$.zip `
    -DestinationPath $PSScriptRoot\Fonts `
    -Force
Remove-Item `
    -Path $PSScriptRoot\Fonts\* `
    -Exclude *.ttf

$asset -match '/v(?<version>[\d.]+)/'
$version = $Matches.version

(Get-Content -Path $PSScriptRoot\Product.xml) `
    -creplace '(\bVersion=)"[\d.]+"', ('$1"' + $version + '"') `
    > $PSScriptRoot\Product.wxs

msbuild /p:Configuration=Release `
    $PSScriptRoot\$safeprojectname$.wixproj
