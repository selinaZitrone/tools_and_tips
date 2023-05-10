# render the website
quarto::quarto_render()

# render slides as pdf
slides_html <- list.files(here::here("docs/slides"),
                          pattern = "2023", full.names = TRUE
)

lapply(slides_html, function(x) {
  pagedown::chrome_print(x,
                         format = "pdf"
  )
})

# copy penguin pdf to docs
file.copy(from = "sessions/additional_material/02_quarto/penguins_paper.pdf",
          to = "docs/sessions/additional_material/")

# commit and push
git2r::add(path = here::here("docs"))
git2r::commit(message = "re-render site")
git2r::push(credentials = git2r::ssh_path())

