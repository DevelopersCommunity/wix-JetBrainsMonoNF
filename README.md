# JetBrainsMono Nerd Font installer for Windows

This is a [WiX v3](https://wixtoolset.org/docs/v3/) based installer for the
[JetBrainsMono Nerd Font](https://www.nerdfonts.com/).

## Build prerequisites

- [Visual Studio 2022 (any edition)](https://visualstudio.microsoft.com/#vs-section)
- [WiX v3](https://wixtoolset.org/docs/wix3/)
- [WiX v3 - Visual Studio 2022 Extension](https://marketplace.visualstudio.com/items?itemName=WixToolset.WixToolsetVisualStudio2022Extension)

WiX v3 is available at <https://github.com/wixtoolset/wix3/releases/>. It
requires .NET Framework 3.5, which can be installed with the following command:

```powershell
Start-Process `
    -FilePath pwsh `
    -ArgumentList "-Command `"& {Enable-WindowsOptionalFeature -Online -FeatureName NetFx3}`"" `
    -Wait `
    -Verb RunAs
```

## Build

Run the `Build-Installer.ps1` PowerShell script to build the installer.

If successful, the MSI file will be available in the
`JetBrainsMonoNF\bin\Release` directory.
