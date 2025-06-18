# Load packages
library(palmerpenguins)
library(ggplot2)
library(dplyr)


# Make a Scatterplot
ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(
    color = species,
    shape = species
  ), size = 3) +
  labs(
    title = "Bill length and depth of penguins",
    x = "Bill length (mm)", y = "Bill depth (mm)"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# Summarize the data
penguins |>
  group_by(species) |>
  summarise(
    mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
    mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE)
  ) |>
  arrange(mean_bill_length, mean_bill_depth) |>
  print()
