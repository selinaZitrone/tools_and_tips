print("Starting background process")

my_data <- data.frame(
  id = 1:10,
  value = rnorm(10)
)

# Simulate computation time (sleep for 20 sec)
Sys.sleep(20)

# Save the results
write.csv(my_data, "background_results.csv")

print("The background results are here!")
