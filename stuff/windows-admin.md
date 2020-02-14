# windows-admin

## list installed apps

```powershell
#--- List all installed programs --#
Get-ItemProperty
HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
| Select-Object DisplayName, DisplayVersion, Publisher, InstallDate
|Format-Table -AutoSize

#--- List all store-installed programs --#
Get-AppxPackage | Select-Object Name, PackageFullName, Version |Format-Table
-AutoSize
```
