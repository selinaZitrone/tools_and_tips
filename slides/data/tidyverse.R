# Prepare data ---------------------------------------------------------------
# arc_weather <- lterdatasampler::arc_weather
# # Cut the table to make less computationally demanding
# arc_weather <- arc_weather[1:365, ] |> select(-daily_precip, -mean_windspeed)
# arc_weather <- mutate(arc_weather, station = "Foolik")
# arc_weather_poolik <- arc_weather |> mutate(station = "Poolik")
# # add 1 °C and some random noise to arc_weather polik
# arc_weather_poolik <- arc_weather_poolik |>
#   mutate(mean_airtemp = mean_airtemp + 3 + rnorm(n = nrow(arc_weather_poolik), mean = 0, sd = 0.5))

# arc_weather <- bind_rows(arc_weather, arc_weather_poolik)

# arc_weather <- arc_weather |> pivot_wider(names_from = station, values_from = c(mean_airtemp))

# names(arc_weather) <- c("date", "foolik_mean_temp_c", "poolik_mean_temp_c")
# write_csv(arc_weather, "data/arc_weather.csv")

# Reproduce slides -----------------------------------------------------------

# Load libraries
library(tidyverse)

# Creating a tibble -----------------------------------------------------------
tibble(
  x = 1:26,
  y = letters,
  z = factor(LETTERS)
)

data.frame(
  x = 1:26,
  y = letters,
  z = factor(LETTERS)
)

# Read data -------------------------------------------------------------------
arc_weather <- read_csv(file = "slides/data/arc_weather.csv")
arc_weather

# Tidy data -------------------------------------------------------------------
arc_weather <- pivot_longer(arc_weather,
  cols = c(foolik_mean_temp_c, poolik_mean_temp_c),
  names_to = "station",
  values_to = "mean_temp_c")
arc_weather

# Transform data --------------------------------------------------------------

select(arc_weather, date, mean_temp_c)

filter(arc_weather, station == "foolik_mean_temp_c")

filter(arc_weather, month(date) == 5)

filter(arc_weather, str_detect(station, "foolik"))

mutate(arc_weather, mean_temp_k = mean_temp_c + 274.15)

arc_weather <-
  mutate(arc_weather, station = str_remove(station, "_mean_temp_c"))
arc_weather

summarize(arc_weather,
  overall_mean = mean(mean_temp_c, na.rm = TRUE))

arc_weather %<>%
  group_by(station) %>%
  summarize(overall_mean = mean(mean_temp_c, na.rm = TRUE))

arc_weather_group <- group_by(arc_weather, station)
summarize(arc_weather_group, overall_mean = mean(mean_temp_c, na.rm = TRUE))


arc_weather_group <- group_by(arc_weather, station, month(date))
summarize(arc_weather_group, overall_mean = mean(mean_temp_c, na.rm = TRUE))

summarize(arc_weather,
  overall_mean = mean(mean_temp_c, na.rm = TRUE), .by = station)

# The pipe operator ----------------------------------------------------------
arc_weather |>
  group_by(station) |>
  summarize(overall_mean = mean(mean_temp_c, na.rm = TRUE))

arc_weather |>
  group_by(station, month(date)) |>
  summarize(overall_mean = mean(mean_temp_c, na.rm = TRUE))

# Whole pipleline from above:
read_csv(file = "slides/data/arc_weather.csv") |>
  pivot_longer(cols = c(foolik_mean_temp_c, poolik_mean_temp_c),
    names_to = "station",
    values_to = "mean_temp_c") |>
  mutate(mean_temp_k = mean_temp_c + 274.15) |>
  mutate(station = str_remove(station, "_mean_temp_c")) |>
  group_by(station) |>
  summarize(overall_mean = mean(mean_temp_c, na.rm = TRUE))

# Visualize data -------------------------------------------------------------
arc_weather_may <- filter(arc_weather, month(date) == 5)
ggplot(data = arc_weather_may,
  aes(
    x = date,
    y = mean_temp_c,
    color = station
)) +
  geom_point()

arc_weather |>
  filter(month(date) == 5) |>
  ggplot(aes(
    x = date,
    y = mean_temp_c,
    color = station)) +
  geom_point() +
  geom_smooth() +
  labs(
    title = "Mean temperature in May",
    x = "Date",
    y = "Mean temperature (°C)") +
  scale_color_viridis_d()

# Purrr ----------------------------------------------------------------------
set.seed(123)
rnorm(n = 4, mean = 1, sd = 1)
rnorm(n = 4, mean = 2, sd = 1)
rnorm(n = 4, mean = 3, sd = 1)
rnorm(n = 4, mean = 4, sd = 1)

# Use purrr
set.seed(123)
means <- 1:4
samples <- map(means, rnorm, n = 4, sd = 1)
str(samples)

means |>
  map(rnorm, n = 4, sd = 1) |>
  str()

# Read in multiple files
paths <- list.files("slides/data", pattern = "oolik", full.names = TRUE)
arc_weather_files <- map(paths, read_csv)
arc_weather_files

arc_weather_files |>
  map(\(x) lm(mean_temp_c ~ date, data = x)) |>
  map(summary) |>
  map_dbl("r.squared")

# Or bind the data togehter
bind_rows(arc_weather_files)
