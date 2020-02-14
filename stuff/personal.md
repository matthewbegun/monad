# don't lose these

bits to make living on a computer more pleasant than eating rusty nails

## system management

```cmd
# mount efi partition in admin cmd.exe
mountvol.exe S: /s
```

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

## local accumulation of wisdom

- run `code (Get-ChildItem $Home\.vscode\extensions\ms-vscode.PowerShell-*\examples)[-1]` in a terminal to get to the [powershell extension example scripts](https://github.com/PowerShell/vscode-powershell/blob/master/examples/README.md)
- run `choco list -li > choco-list-li.txt` to create a [list](choco-list-li.txt) of all "packages" installed on local machine
- run `choco list -li > choco-list-l.txt` to create a [list](choco-list-l.txt) of all "packages" installed by chocolatey on local machine
- run `scoop export > scoop-list.txt` to create a [list](scoop-list.txt) of installed scoop apps

### mutually beneficial

- writing extensive in source documentation is not mutually beneficial, because it inconveniences present-self and only potentially benefits future-consumer
- writing automated tests *is* mutually beneficial because it provides confidence for present-self and documentation that is up to date for future-consumer
- present-self and future-self are both consumers of the conceptual work
- that means that in xp approach to ced all work must be mutually beneficial for
    - present-self
    - future-self
    - the-dave
