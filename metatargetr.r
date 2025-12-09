# Setup ####
# Note: You may need to install the required libraries
library(readr)
library(dplyr)
library(purrr)
library(metatargetr)
# https://favstats.github.io/metatargetr/

# Meta Ad Library ####
# https://www.facebook.com/ads/library/

## Page information ####

pages <- c("47930567748", "78502295414", "21289227249", "47217143218", "47694585682") # page IDs SPD, CDU, Grüne, FDP, Die Linke

pages_info <- map_df(pages,
                     ~ get_page_insights(.x,
                                         include_info = "page_info"))

glimpse(pages_info)

## Targeting criteria ####

ids <- c("25749647410", "8807334278") # Labour Party, Conservative Party

targeting_uk <- map_df(ids,
                       ~ get_targeting(id = .x,
                                       timeframe = "LAST_7_DAYS"))

glimpse(targeting_uk)

write_csv(targeting_uk, "./targeting_uk.csv")

# Google ####
# https://adstransparency.google.com

google <- ggl_get_spending(advertiser_id = "AR05647100275832389633", # Labour Party
                           start_date = "2025-01-01", 
                           end_date = "2025-12-01",
                           cntry = "UK")

glimpse(google)
