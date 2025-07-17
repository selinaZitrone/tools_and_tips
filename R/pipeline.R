# render the website
quarto::quarto_render()

# render slides as pdf
slides_html <- list.files(
  here::here("docs/slides/"),
  pattern = "*.html",
  full.names = TRUE
)

results <- lapply(slides_html, function(x) {
  tryCatch(
    {
      # Increase timeout and add extra chrome options
      pagedown::chrome_print(
        x,
        format = "pdf",
        timeout = 180, # 3 minutes
        options = c("--disable-dev-shm-usage", "--no-sandbox")
      )
      print(paste0("✓ Successfully printed ", x))
      return(TRUE)
    },
    error = function(e) {
      print(paste0("✗ Failed to print ", x, ": ", e$message))
      return(FALSE)
    }
  )
})

# Print summary
success_count <- sum(unlist(results))
print(paste0(
  "Successfully printed ",
  success_count,
  " out of ",
  length(slides_html),
  " slides"
))

# commit and push
git2r::add(path = here::here("docs"))
git2r::commit(message = "re-render site")
git2r::push(credentials = git2r::ssh_path())
