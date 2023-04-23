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

Run the `JetBrainsMono\Build-Installer.ps1` PowerShell script to build the
installer.

If successful, the MSI file will be available in the `JetBrainsMono\bin\Release`
directory.

## Visual Studio project template

You can use the included [Visual Studio project
template](https://learn.microsoft.com/visualstudio/ide/creating-project-and-item-templates)
to build an installer for a Nerd Font of your choice. To use the template, zip
the files in the `VSTemplate` folder and copy it to your `%USERPROFILE%\Documents\Visual Studio 2022\Templates\ProjectTemplates`
folder.

After installing the template, create a new Visual Studio project using it, and
name the project with the name of one of the zip files available for download in
the [releases page](https://github.com/ryanoasis/nerd-fonts/releases) of the
Nerd Font GitHub repository.
