$ErrorActionPreference = 'Stop'

$asset = gh release view `
    -R ryanoasis/nerd-fonts `
    --json assets `
    -q '.assets[].url|match("^.*JetBrainsMono.*$"; "g")|.string'

Invoke-WebRequest -Uri $asset -OutFile $PSScriptRoot\JetBrainsMono.zip
Remove-Item `
    -Path $PSScriptRoot\JetBrainsMonoNF\Fonts `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue
New-Item `
    -Path $PSScriptRoot\JetBrainsMonoNF\Fonts `
    -ItemType Directory
Expand-Archive `
    -Path $PSScriptRoot\JetBrainsMono.zip `
    -DestinationPath $PSScriptRoot\JetBrainsMonoNF\Fonts `
    -Force
Remove-Item `
    -Path $PSScriptRoot\JetBrainsMonoNF\Fonts\* `
    -Exclude *Windows*

$asset -match '/v(?<version>[\d.]+)/'
$version = $Matches.version

(Get-Content -Path $PSScriptRoot\JetBrainsMonoNF\Product.xml) `
    -creplace '(\bVersion=)"[\d.]+"', ('$1"' + $version + '"') `
    > $PSScriptRoot\JetBrainsMonoNF\Product.wxs

msbuild /p:Configuration=Release `
    $PSScriptRoot\JetBrainsMonoNF\JetBrainsMonoNF.wixproj
