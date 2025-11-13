# ensure Require
if (!require("Require")) {install.packages("Require"); require("Require")}

# ensure project dependencies
packages <- c("tidyverse",
              "broom",
              "patchwork")
Require(packages)

