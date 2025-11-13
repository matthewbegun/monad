# Risms

## windoze bs

- set R_HOME env var to avoid issues with path
    - `C:\PROGRA~2\...` is the short path version of `"C:\Program Files (x86)\..."`
    - `C:\PROGRA~1\...` is the short path version of `"C:\Program Files\..."`

```pwsh
$env:R_HOME = "C:\PROGRA~2\R\R-4.5.2\bin"
& "$env:R_HOME\Rscript.exe" myscript.R
```

## advance package management

- `Require` (new money), leverages `pak` for fast, reliable installs and matches standard R syntax
```r
# ensure Require
if (!require("Require")) {install.packages("Require"); require("Require")}

# ensure project dependencies
packages <- c("tidyverse", "broom", "patchwork")
Require(packages)

```

- `pacman` (old money)
```r
# ensure pacman
ifelse(!require(pacman), install.packages("pacman"), library(pacman))
# ensure project dependencies
p_load(tidyverse, broom)
```
