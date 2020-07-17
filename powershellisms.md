# for future reference

base names
: `$basename = (Split-Path -Path . -Leaf)`

change working directory to location of `pipenv.exe`
: `cd (split-path -path ((gcm pipenv).path) -Parent)`
