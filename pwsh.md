# for future reference

base names
: `$basename = (Split-Path -Path . -Leaf)`

change working directory to location of `pipenv.exe`
: `cd (split-path -path ((gcm pipenv).path) -Parent)`

check shell elevated privelages
: [from super user](https://superuser.com/a/756696)
    ```powershell
    [([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent() `
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    ```

This will list all installed windows fonts
: [from gisthub](https://gist.github.com/matthewjberger/aeda92755012184e94033783027ddf3a)
    ```powershell
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    (New-Object System.Drawing.Text.InstalledFontCollection).Families
    ```
