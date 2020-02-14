# Windows 10 bootstrap procedure

## Tasks
(A) [ ] TODO: review and update this whole thing

This list could form the basis of a declarative setup strategy for windows dev environments.

## pre-script era

1. install [logitech options](https://www.logitech.com/en-au/product/options)
    - [version 8.0.863 download link](https://download01.logi.com/web/ftp/pub/techsupport/options/Options_8.0.863.exe)
1. add `matth` local admin account
1. windows updates, all the updates

## Scripts

Scripts are segregated by privilege requirement.

1. init-01-admin.ps1
1. init-11-user.ps1

## git

Really you'd just clone your dotfile repo and none of this would matter at all.

- in windows

```powershell
git config --global user.name="Matthew Begun"
git config --global user.email="matthew.begun@gmail.com"
git config --global credential.helper wincred
git config --global core.autocrlf input
```

- in wsl

TODO: escape username; alternate sources? (i.e. not scoop)

```bash
# grab the gitconfig from the repo, needs to include some variant of this
# alternately - shadow with git-for-windows (ie make a git exe that calls "git.exe $@")
git config --global credential.helper "/mnt/c/Users/z3391967/scoop/apps/git/current/mingw64/libexec/git-core"
```

## Manual interventions

1. "input language hotkeys" can go fuck themselves
1. Add user accounts to Microsoft Store
2. Set up VSCode <-- have think about the best way to do this
3. Install apps from the Microsoft Store
    - Fitbit
    - Minecraft
    - Ubuntu 18.04 WSL
    - Debian
    - Alpine
4. Add microsoft accounts to onedrive
5. Sync sharepoint sites ? maybe not

## Sources of info

- [Xfournet scoop-bootstrap](https://github.com/xfournet/sboot)
- [Xfournet sccop-persist](https://github.com/xfournet/scoop-persist)
- [Disassembler0 Win10-init](https://github.com/Disassembler0/Win10-Initial-Setup-Script)
- [farag2 win10-setup](https://github.com/farag2/Windows-10-Setup-Script)
- [AmrEldib WindowsCustomizations](https://github.com/AmrEldib/WindowsCustomizations)
- [AmrEldib WindowsContextMenuCustomizations](https://github.com/AmrEldib/WindowsContextMenuCustomizations)
- [hyberia.org install scripts](https://hyberia.org/explore/repos)
- [fingersonfire powershell-windowsclient](https://github.com/fingersonfire/powershell-windowsclient)
- [boxstarter](https://boxstarter.org/)
- [HashiCorp Vagrant](https://www.vagrantup.com/)
- [Windows 10 Service Defaults](http://revertservice.com/10/)
