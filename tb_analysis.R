## Loading packages
library(tidyverse)

# set working directory
setwd("/home/rstudio/project")   # this is where your data folder actually is

## load the four csv files ##
burden  <- read_csv("data/WHO_TB burden_estimates.csv")
mdr                       <- read_csv("data/WHO_MDRRR_TB_burden_estimates.csv")
by_household_contact      <- read_csv("data/WHO_TB_infection_estimates_household_contacts.csv")
by_age_sex <- read_csv("data/TB_incidence_estimates_burden_by_age_sex_riskfactor.csv")

#Keep only Pakistan
burden <- burden %>% filter(iso3== "PAK")
mdr     <- mdr %>% filter(iso3== "PAK")
by_household_contact <- by_household_contact %>% filter(iso3== "PAK")
by_age_sex <- by_age_sex %>% filter(iso3== "PAK")


# Find the missing values
colSums(is.na(burden))
colSums(is.na(burden)) %>% sort(decreasing = TRUE) %>% head(10)

colSums(is.na(mdr))
colSums(is.na(mdr)) %>% sort(decreasing = TRUE) %>% head(10)

colSums(is.na(by_household_contact))
colSums(is.na(by_household_contact)) %>% sort(decreasing = TRUE) %>% head(10)

colSums(is.na(by_age_sex))
colSums(is.na(by_age_sex)) %>% sort(decreasing = TRUE) %>% head(10)

## Performing Basic Exploratory Data Analysis
range(burden$year)

# 2024 key stats
burden %>% filter(year == 2024) %>% select(e_inc_num, e_inc_100k, e_mort_num)

# Drug-resistant % in 2015 and 2024
mdr %>% filter(year %in% c(2015, 2024)) %>% select(year, e_rr_pct_new)

# Latest preventive treatment coverage
by_household_contact %>% 
  slice_max(year, n = 1) %>%
  mutate(coverage_pct = round(100 * newinc_con_prevtx / e_hh_contacts, 1)) %>%
  select(year, newinc_con_prevtx, e_hh_contacts, coverage_pct)


## Basic Plots

# Plot 1 – Incidence & Mortality over time
ggplot(burden, aes(x = year)) +
  geom_line(aes(y = e_inc_100k, colour = "Incidence"), size = 1.5) +
  geom_line(aes(y = e_mort_100k, colour = "Mortality"), size = 1.5) +
  labs(title = "Pakistan TB Incidence & Mortality per 100 000", colour = "") +
  theme_minimal()

# Plot 2 – Drug-resistant TB %
ggplot(mdr, aes(x = year, y = e_rr_pct_new)) +
  geom_line(colour = "red", size = 1.5) +
  labs(title = "% Drug-resistant TB in new cases", y = "%") +
  theme_minimal()

# Plot 3 – Age-Sex Pyramid 2024
ggplot(by_age_sex %>% filter(risk_factor == "all"),
       aes(x = best, fill = sex, y = ifelse(sex == "f", -best, best))) +
  geom_col(width = 0.9) +
  coord_flip() +
  scale_y_continuous(labels = abs) +
  labs(title = "TB Cases by Age & Sex – Pakistan 2024", x = "Number of cases") +
  theme_minimal()


## Save the plots ## 

ggsave("1_incidence_mortality.pdf", width = 10, height = 6)
ggsave("2_drug_resistance.pdf",      width = 10, height = 6)
ggsave("3_age_pyramid.pdf",          width = 11, height = 7)



