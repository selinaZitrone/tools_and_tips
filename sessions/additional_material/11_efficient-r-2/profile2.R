# Create a data frame with 150 columns and 400000 rows
df <- data.frame(matrix(rnorm(150 * 400000), nrow = 400000))

# Calculate means of each column except the id column
means <- apply(df, 2, mean)

# Subtract mean from each column except the id column
for (i in seq_along(means)) {
  df[, i] <- df[, i] - means[i]
}