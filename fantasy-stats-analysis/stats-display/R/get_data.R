library(tidyverse)
library(ggrepel)
library(ggimage)
library(nflfastR)

# pbp <- load_pbp(2017:2020)
# saveRDS(pbp, file = "pbp_2017_2020.rds")

player_stats <- load_pbp(2017:2020)


calc_fantasy_points <- function(year=2020) {
    
    nflfastR::load_pbp(year) %>%
        dplyr::filter(week <= 16) %>%
        nflfastR::calculate_player_stats() %>%
        dplyr::mutate(
            ppg = fantasy_points_ppr / games
        ) %>%
        filter(games > 5) %>%
        dplyr::arrange(-ppg)
}

total_fantasy_ppr <- calc_fantasy_points(2020)

dplyr::select(player_name, recent_team, games, fantasy_points_ppr, ppg) %>%
    utils::head(10) %>%
    knitr::kable(digits = 1)



player_rosters <- nflfastR::fast_scraper_roster(seasons)
