# JetBrainsMono Nerd Font installer for Windows

This is a [WiX v4](https://wixtoolset.org/docs/intro/) based installer for the
[JetBrainsMono Nerd Font](https://www.nerdfonts.com/).

This installer is available on
[winget](https://learn.microsoft.com/windows/package-manager/winget/):

```
winget install --id DEVCOM.JetBrainsMonoNerdFont
```

## Build prerequisites

- [WiX v4](https://wixtoolset.org/docs/intro/)
- [GitHub CLI](https://cli.github.com/)

Install them with the following commands:

```powershell
dotnet tool install --global wix
winget install --id GitHub.cli
```

## Build

Run the `src\Build-Installer.ps1` PowerShell script to build the installer.

If successful, the MSI file will be available in the `src\bin\Release\en-US`
directory.
