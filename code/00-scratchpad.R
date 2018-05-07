###############################################################################
## scratchpad

library(readr)
library(dplyr)

df <- read_tsv("data/UKDA-6614-tab/tab/us_w7/g_indresp.tab")
df.hh <- read_tsv("data/UKDA-6614-tab/tab/us_w7/g_hhresp.tab")

grep("+forena+", colnames(df.hh))

     