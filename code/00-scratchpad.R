###############################################################################
## scratchpad

library(readr)
library(dplyr)

# import data
# wave 7 of understanding society
df <- read_tsv("data/UKDA-6614-tab/tab/us_w7/g_indresp.tab")
df.hh <- read_tsv("data/UKDA-6614-tab/tab/us_w7/g_hhresp.tab")

# wave 1 of bhps
df.1 <- read_tsv("data/UKDA-6614-tab/tab/bhps_w1/ba_indresp.tab")

# wave 1 of bhps
elsa.1 <- read_tsv("data/UKDA-5050-tab/tab/wave_7_elsa_data.tab")
elsa.1 <- read_tsv("data/UKDA-5050-tab/tab/wave_7_elsa_data.tab")


# Get age distribution of wave 7
df %>% 
  select(g_dvage, g_dvage2uk) %>% 
  mutate(age_group = ifelse(g_dvage >= 85, "over85",
                            ifelse(g_dvage >= 80, "80-85",
                                  ifelse(g_dvage >= 60, "60-80", "under60")))) %>% 
  group_by(age_group) %>% 
  summarise(sum = n())

# get age distribution at wave 1 of BHPS
df.1 %>% 
  mutate(age = 1991 - ba_doby) %>% 
  select(age) %>% 
  mutate(age_group = ifelse(age >= 85, "over85",
                            ifelse(age >= 80, "80-85",
                                   ifelse(age >= 60, "60-80", "under60"))),
         total = n()) %>% 
  group_by(age_group) %>% 
  summarise(sum = n()) 

# get age distribution of continued BHPS sample in wave 7

df %>% 
  filter(pid != -8) %>% 
  select(g_dvage) %>% 
  mutate(age_group = ifelse(g_dvage >= 85, "over85",
                            ifelse(g_dvage >= 80, "80-85",
                                   ifelse(g_dvage >= 60, "60-80", "under60")))) %>% 
  group_by(age_group) %>% 
  summarise(sum = n())


# get age distribution of continued BHPS sample in wave 7 also in wave 1

df %>% 
  inner_join(df.1[1]) %>% 
  filter(pid != -8) %>% 
  select(g_dvage) %>% 
  mutate(age_group = ifelse(g_dvage >= 85, "over85",
                            ifelse(g_dvage >= 80, "80-85",
                                   ifelse(g_dvage >= 60, "60-80", "under60")))) %>% 
  group_by(age_group) %>% 
  summarise(sum = n())





