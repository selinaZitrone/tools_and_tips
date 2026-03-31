system("quarto render --cache-refresh")

# Render slide PDFs only for slides that have changed since the last PDF build.
# PDFs are stored in slides/slides_pdf/ (tracked in git, never deleted by quarto render).
# Quarto automatically copies them to docs/slides/slides_pdf/ on each render.

slides_qmd <- list.files(
  here::here("slides/"),
  pattern = "\\.qmd$",
  full.names = TRUE
)

lapply(slides_qmd, function(qmd) {
  name <- tools::file_path_sans_ext(basename(qmd))
  pdf_src <- here::here("slides/slides_pdf", paste0(name, ".pdf"))
  pdf_docs <- here::here("docs/slides/slides_pdf", paste0(name, ".pdf"))
  html <- here::here("docs/slides", paste0(name, ".html"))

  # Skip if quarto didn't render an HTML for this file
  if (!file.exists(html)) {
    return(invisible(NULL))
  }

  # Regenerate if PDF is missing or source .qmd is newer than existing PDF
  needs_update <- !file.exists(pdf_src) || file.mtime(qmd) > file.mtime(pdf_src)

  if (needs_update) {
    message("Rendering PDF: ", name)
    pagedown::chrome_print(
      html,
      output = pdf_src,
      timeout = 180,
      options = c("--disable-dev-shm-usage", "--no-sandbox")
    )
    file.copy(pdf_src, pdf_docs, overwrite = TRUE)
  } else {
    message("PDF up to date, skipping: ", name)
  }
})

# commit and push — include both rendered site and any updated PDFs in source
git2r::add(path = here::here("docs"))
git2r::add(path = here::here("slides/slides_pdf"))
git2r::commit(message = "re-render site")
system("git push")
