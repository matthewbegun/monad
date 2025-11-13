# don't lose these

bits to make living on a computer more pleasant than eating rusty nails

## online sources of wisdom

- [posh-git on github](https://github.com/dahlbyk/posh-git)
- [posh-git in git scm book](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-PowerShell)
- [scoop-completion](https://github.com/liuzijing97/scoop-completion/)
- [scoop bootstrapping](https://github.com/xfournet/sboot)

This command from the [posh-git issue template](https://raw.githubusercontent.com/dahlbyk/posh-git/master/ISSUE_TEMPLATE.md)

```powershell
"- posh-git version/path: $($m = Get-Module posh-git; '{0} {1} {2}' -f $m.Version,$m.PrivateData.PSData.Prerelease,$m.ModuleBase.Replace($HOME,'~'))`n- PowerShell version: $($PSVersionTable.PSVersion)`n- $(git --version)`n- OS: $([System.Environment]::OSVersion)"
```

produces this very cool output

```raw
- posh-git version/path: 1.0.0 beta3 ~\Documents\WindowsPowerShell\Modules\posh-git\1.0.0
- PowerShell version: 5.1.18362.145
- git version 2.23.0.windows.1 hub version 2.12.3
- OS: Microsoft Windows NT 10.0.18362.0
```

