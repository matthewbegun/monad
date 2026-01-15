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

`for each` loops
: 
```pwsh
$packages = @("Typst.Typst","astral-sh.uv","jqlang.jq",...)

# keyword / no pipe
foreach ($package in $packages) {
    winstall $package
}

# OR

# cmdlet / pipe
$packages | ForEach-Object {winstall $_}
$packages | % {winstall $_}

# OR

# lists have a ForEach method
$packages.ForEach( { winstall $_ } )
$packages = @("Typst.Typst","astral-sh.uv","jqlang.jq",...).ForEach( { winstall $_ } )
```

## winget

Since export appears to be fubar'd, try the following:

get a list of all installed packages that are available on winget
: `winget ls | ugrep -e 'winget$`

get a list of all installed packages that are available on winget / msstore
: `winget ls | ugrep -e '(mssto…|winget)$'`

now with more saving
: winget ls | ugrep -e '(mssto…|winget)$' > .\winget_packages.txt




