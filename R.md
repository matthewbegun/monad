# Risms

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
