# Risms
- top of every file
```r
# ensure pacman
ifelse(!require(pacman), install.packages("pacman"), library(pacman))
# ensure project dependencies
p_load(tidyverse, broom)
```
