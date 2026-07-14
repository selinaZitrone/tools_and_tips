# Lecture plan: Good practices for sharing research code

> Working plan for the 1-hour lecture (~45 min content + Q&A) in the
> *Scientific Workflows: Tools and Tips* series. Single source for slide drafting.
> Revision 4: merged with Selina's Obsidian canvas review (2026-07-14).
> Companion to the fixed workshop description in `Lecture - Code sharing.md`.

## Context & constraints

- **Format:** 1-hour online lecture (Webex). Target **~44-46 min content** (live online
  with beginners runs slow; do not plan for 50).
- **Audience:** PhD students in biology, pharmacy, medicine. Mixed skill, many beginners.
  Work in R and/or Python, not necessarily strong programmers. **Their data is often
  sensitive / cannot be shared.**
- **Tone:** between casual and academic; approachable, practical, technically accurate.
- **Style rules (user):** NO em-dashes anywhere (use commas, colons, parentheses, or a new
  sentence). Emojis sparingly: keep the standard series-intro icons and established recurring
  icons from earlier decks; no emoji decoration on ordinary bullets, headings, or lists.
  **Slides: less text than the first draft.** Every slide carries one idea plus an artifact,
  not a paragraph.
- **Scope:** language-agnostic, about **data-analysis repositories** (not scientific
  software). Concrete tips; R / Python / IDE pointers stay *one-liners or tabs*, no
  deep-dives. Focus is the project around the code (structure, data, licence, archive),
  not code polish.
- **Overlap with earlier decks is fine and often useful**: the audience has largely
  turned over since the related lectures ran.
- **Keep everything practical and actionable, not theoretical.** Every point should give the
  audience something they can *do* to their own repository: a concrete step, a file to add,
  a command, a setting to change. If a point can't be turned into an action, it probably
  doesn't belong.
- **First goal: a working first version of the lecture.** Details (exact close, demo form,
  next-lecture slide) are deliberately left open and marked as such.

## Through-line

**Building the publishable repository, step by step.** The story: the analysis for a
fictional paper (*"Temperature and antibiotic resistance in soil bacteria"*) is done and
the paper is submitted; now the repository gets assembled for publication. Five sections,
each a category with a reuser question as its subtitle. Each section ends with the
recurring **file-tree slide**: the same repo tree, with that section's additions marked
`<- new`. The tree completes in section 5 with the DOI badge (the climax of the build).

This is a **build, not a cleanup**: the repo is never framed as a disaster, it is just not
built yet. Bad examples (file names, `setwd()`) stay local to their slide.

Two reassurances stated early and kept in view:
- **Shareable ≠ perfect.** Published code needs to be understandable, rerunnable enough,
  documented, and safe to release: not elegant or package-quality.
- **"No shareable data" ≠ failure.** There is an acceptable path for restricted/sensitive
  data (section 3).

## Relationship to existing lectures (what's new here)

Already covered earlier (re-use what's good; audience has changed):
- `2025_05_15_r-code-that-lasts`: project structure, file naming, `here`/paths, script
  structure, style, modularization, `renv`.
- `2023_07_20_research_compendia`: the compendium concept; data/methods/output separation;
  licence/DOI at a high level.

**Fresh contribution:** the publication-readiness lens, the data-situation statements
(incl. the sensitive-data reality), code + data **licensing**, citation (README minimum +
**`CITATION.cff`** upgrade), the concrete **GitHub → Zenodo → release → DOI** workflow,
and the **AI help** section (README drafting + repo audit + the in-development reviewer).

## Deliverables

1. Slide deck `.qmd` (revealjs, series template).
2. Session landing page `sessions/17_code-sharing.qmd` (hosts all extra material).
3. **Repository checklist** on the website (NOT built up on slides; shown once at the
   close and linked). Its spine is the 5 sections. **Includes the "last look" items**
   (scan file names / column headers for patient IDs, stray confidential files, junk)
   as checklist entries only, no slide beat.
4. **Two take-home prompts** on the website:
   a. README-drafting prompt (paste into any AI tool with repo access),
   b. portable repo-audit prompt (generic, tool-independent; must not depend on the
      in-development tool being ready).
5. **Resources/tools list** (real planned slide + handout section).

## Section-by-section outline (~45 min)

Section headers on slides: **noun + question subtitle**, e.g.
`# Data · Can someone understand the data situation?`

### 0. Intro (~6.5 min)
- **Series-intro slide** (standard opener, 1.5 budgeted).
- **Evidence hook:** Cooper et al. (2026), *Methods in Ecology and Evolution*,
  doi:10.1111/2041-210X.70338 (1861 papers, 7 BES journals, 2017-2024): code sharing is
  still not the norm. Headline stat: **only 35% of papers that used code archived it.**
  Paper screenshot + Figure 1 (figure licence/credit line: todo).
- **Second beat: shared is often not sufficient.** Sub-stats from the same paper: of
  papers with archived code, only 61% had a README, 74% a licence, 79% a DOI (94% / 93% /
  86% could be located / downloaded / opened). **Map these gaps onto the five questions**
  on the roadmap slide: the gaps in this figure are exactly today's five sections.
- **Own-experience beat** (1 slide): you download someone's code and it doesn't run, the
  structure is opaque, it's chaotic. Often that someone is **future you**.
- **Blockers** (1 slide): time pressure, lack of knowledge, not required by journals, code
  not part of peer review. Framing line: every blocker is "it's hard", none is "it's not
  worth it"; today fixes "it's hard".
- **Benefits** (1 slide, max 4 bullets): transparency and greater faith in the research ·
  reproducibility, results can be verified · credit, collaboration, visibility ·
  future you can pick it up or hand it over.
  **Citation-advantage claim (RESOLVED 2026-07-14): phrase it honestly, do NOT promise
  citations for code.** The evidence: sharing *data* has a well-replicated citation
  advantage (Colavizza et al. 2020, ~25% across 531,889 PLOS/BMC articles), but for
  *code* the evidence is weaker and field-dependent (an astrophysics study finds ~+16%;
  Colavizza et al. found no significant code effect). Safe slide wording: "data sharing
  is linked to more citations; for code the evidence is thinner, but reuse, collaboration
  and visibility are real." Speaker note carries the references.
- **Today + scope:** shareable ≠ perfect, minimum requirements and high-impact changes;
  the 5 questions as roadmap; scope lines (data-analysis repos, language-agnostic with
  R/Python examples, the project not the code); reassurance line: "can't share your data?
  there is an accepted path (Data section)"; **introduce the example repo and the build
  thread** ("we assemble this repository as we go"); teasers: checklist on the website at
  the end, AI ideas at the end.
- FAIR stays cut; optional single name-drop at the close.

### 1. Structure & orientation · Can someone understand it? (~6 min)
- **Folder structure:** clear conventional structure, not one flat folder; separate data,
  analysis/methods, output. Example tree (= the repo's first build step; "does not need
  to be exactly this, but similarly intuitive").
- **File names** (2 slides max, re-used material + Jenny Bryan pointer):
  human readable (informative, reveal content) and machine readable (no spaces, special
  characters, umlauts); work with default ordering (left-padded numbers, ISO dates
  YYYY-MM-DD; date-ordering example: todo).
- **README** (the container artifact): the entry point into the project. Minimum
  questions it answers: what this is and which paper it belongs to · how to run it ·
  where the data is and what you may do with it · how to cite and under which licence ·
  who to ask when it breaks. Format: plain text/markdown, no docx.
  Show the **README skeleton** (canvas draft is the base) + **one real annotated README
  screenshot** (pick from CODECHECK register etc.: todo).
  Echo line: these minimum questions are the five lecture questions in miniature.
- **Code quality, exactly 1 slide, reassurance framing:** explicitly NOT a requirement
  for sharing (shareable ≠ perfect). If you want to go further: comments, split large
  scripts, follow a style. Link to *R code that lasts* session page.
- **Tree recap:** + folders, + README.

### 2. Running it · Can someone rerun it and get the same result? (~6 min)
- **Run-order ladder** (tabset R/Python):
  Level 1 = numbered scripts (`01_`, `02_`) + order described in the README.
  Level 2 = one main script that runs everything in order; users open one file.
  R: `main.R` with `source("analysis/01_clean-data.R")` etc (example in canvas).
  **Python (RESOLVED): a `main.py` / `run_analysis.py` / `runall.py` orchestrator**, the
  same idea, one entry point run with `python main.py`. There is no single blessed name;
  `main.py` is fine and mirrors `main.R` on the slide. Import the step functions, or call
  the scripts with `subprocess`; keep the slide at the "one file runs everything" level.
  Level 3 = one-liner: workflow tools (`targets` for R, `snakemake` for Python) when you
  outgrow this.
- **No absolute paths:** `setwd()` / hard-coded paths bad → paths relative to project
  root.
  R: RStudio projects + the `here` package.
  **Python (RESOLVED): build paths with `pathlib` and anchor them at the project root.**
  Cheapest habit: always run from the project root so relative paths just work. The
  direct `here` equivalents are **`pyprojroot`** (`from pyprojroot import here;
  pd.read_csv(here("data/raw/growth-assay.csv"))`, finds the root via `.git`/`.here`) and
  `pyhere`. Slide: show `pathlib` + one line naming `pyprojroot` as the `here` analogue.
- **Seed** for anything stochastic (one line, tabset).
  R: `set.seed(54315)`.
  **Python (RESOLVED): `rng = np.random.default_rng(54315)`**, then use `rng` (this is
  NumPy's current recommendation; the legacy `np.random.seed()` sets fragile global state
  that any imported code can overwrite). Plain-Python: `random.seed(54315)`. Slide: show
  `default_rng`, one speaker note on why not `np.random.seed`.
- **Dependencies ladder:** record what your code needs and how to install it (language
  version + packages with versions).
  Level 1 = paste into the README: `sessionInfo()` (or `devtools::session_info()`) /
  `pip freeze` (screenshot exists).
  Level 2 = a dedicated file. Frame the two R options as **different jobs, not rivals**
  (decision 2026-07-14):
  - **record *what* you need:** R `DESCRIPTION` (add packages with
    `usethis::use_package()`, install them with **`pak::local_install_deps()`** (VERIFIED:
    installs the dependencies of the package tree at `root = "."`; `local_install_dev_deps()`
    if Suggests should come too)). Python: `requirements.txt`, install with
    `pip install -r requirements.txt`.
  - **record the *exact versions*:** R `renv.lock` (`renv::snapshot()` /
    `renv::restore()`). Python: `environment.yml` (`conda env create -f environment.yml`)
    or a pinned `requirements.txt`.
  Level 3 = one-liner only: containers (Docker) exist; pointer to the **Rocker project**
  (rocker-project.org: ready-made R images, `rocker/rstudio`, `rocker/tidyverse`, version
  tags; the common pattern is a Dockerfile that calls `renv::restore()`). Name it, move on.
- **Tree recap:** numbered scripts, + `main.R`, + `DESCRIPTION`/`renv.lock`.

### 3. Data · Can someone understand the data situation? (~4.5 min)

**SCOPE RULE (standing):** this is a code-sharing lecture; section 3 is NOT "how to share
data". It is one narrow thing: **the repository states what the data situation is**,
because the first question any code-downloader asks is "where do I get the data?".
Filter: does the item produce a line/file in the repo? If not, cut. (Repository choice,
metadata standards, embargoes, GDPR: out. Closing aside teases "data sharing is its own
lecture".)

- **Three honest paths** (decision tree, e.g. Mermaid): **open** (data in the repo, or in
  a data repository like Dryad if needed) / **restricted** (state clearly in the README
  where and how to request it) / **cannot be shared** (include synthetic data + the
  script that produced it). Punchline: "I can't share my data" is not a dead end; path 3
  is a valid publishable repository (the reassurance beat for medicine/pharmacy).
- **Each path as a concrete README statement**: show all three as real sentence text,
  the **restricted** one fullest (it is the one nobody knows how to write).
- **Raw vs processed:** `data-raw/` (read-only) vs `data/` (processed, used in analysis);
  folder-structure slide.
- **Codebook = the README for your data:** describes each variable; can be a README in
  the data folder; small example table (image exists). Open-format line folded in:
  csv/txt, not xlsx; a PDF is not data.
- One-liner: where to put data (Zenodo/Dryad; GitHub's 100 MB file limit).
- Last-look items (patient IDs, stray files) live on the website checklist ONLY.
- **Tree recap:** + `data-raw/`, + `data/`, + codebook.

### 4. Licence & citation · Can someone legally reuse and cite it? (~6 min)
- **No licence = all rights reserved**: even public on GitHub, nobody may legally reuse it.
- **Which licence for code (RESOLVED 2026-07-14, see Open items 8):** teach the ONE
  decision that matters, permissive vs copyleft, in two lines, then give a default.
  - **Permissive (MIT, BSD, Apache-2.0):** anyone may reuse, including in closed or
    commercial work; they must keep your copyright notice. **MIT does require
    attribution.**
  - **Copyleft (GPL-3):** derivatives must stay open under the same licence.
  - **Default for a data-analysis repo: MIT** (unless your group, funder, or institution
    says otherwise). This matches the consensus in research-code guidance: permissive
    licences are recommended for academic code because they lower the barrier to reuse,
    and the big scientific ecosystems (NumPy, SciPy, pandas, matplotlib) are BSD/MIT.
  - **Say out loud, it pre-empts the most common misconception:** NO licence, MIT or GPL
    alike, can force anyone to *cite* you. Licences govern legal reuse; citation is a
    scholarly norm, which is exactly why the citation beat below exists. If people pick
    GPL hoping to be cited, they picked the wrong tool.
  - choosealicense.com for anything beyond this. No licence-taxonomy lecture.
- **The common trap, explicit:** CC licences are for **data/text/figures**, not code;
  code licences (MIT/GPL/Apache) are for **code**. **Creative Commons itself says so:**
  "We recommend against using Creative Commons licenses for software." One repo with
  code + data usually needs **two licences**. Data licence: CC0 or CC-BY (CC 4.0 covers
  database rights).
  **This answers the canvas question ("GPL repo with data inside, how do I license the
  data?") (RESOLVED 2026-07-14):** you do not put data under GPL. The code licence covers
  the code; the data gets its own CC licence. State both in the README (e.g. "Code: MIT.
  Data: CC-BY-4.0"), optionally with a `LICENSE-data` file or a licence note in `data/`.
- **How to add it:** a LICENSE file in the project root: `usethis::use_mit_license()` (or
  `use_gpl3_license()`), or the GitHub licence template, or download the text. Plus a line
  in the README. Optionally show the full MIT text on one slide (it is short: the point).
- **Citation ladder:** minimum = a "How to cite" section in the README (fully legitimate).
  Upgrade (~5 min): **`CITATION.cff`**, generated with the cffinit web form; GitHub shows
  a "Cite this repository" button; Zenodo reads it when archiving a release (VERIFIED:
  help.zenodo.org; speaker-note caveat only: a `.zenodo.json` takes precedence).
  One-line ORCID mention optional. *First candidate to compress if rehearsal runs long.*
- **Tree recap:** + `LICENSE`, + `CITATION.cff`.

### 5. Archive & publish · Can someone find the exact version you used? (~6 min)
- **Why GitHub** (1 quick slide): findable and accessible, version control, renders the
  README, acts as a portfolio. Git encouraged but no tutorial; the web "upload files"
  button is a valid low-barrier entry.
- **GitHub alone is not archiving:** repos are mutable and deletable; great for living
  code, not a frozen citable record.
- **The workflow: NO theoretical click-by-click walkthrough** (decision 2026-07-14).
  One slide showing the four steps in order, plus a link to the official how-to.
  **ORDER MATTERS: Zenodo only archives releases made *after* the switch is on, and the
  DOI is minted automatically.** Steps:
  1. repo on GitHub with LICENSE, README, `CITATION.cff` in it,
  2. **enable the repo on Zenodo** (log in to Zenodo with GitHub, toggle the repo to On),
  3. **create a GitHub release**,
  4. the DOI appears automatically; paste the badge into the README.
  **Link (VERIFIED 2026-07-14, official GitHub Docs, exactly this order):**
  <https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content>
  (section "Issuing a persistent identifier for your repository with Zenodo"). Note: the
  page does NOT cover `CITATION.cff`; for that link GitHub's "About CITATION files" page
  or cffinit in section 4. Zenodo requires the repo to be **public**.
- Where the DOI goes: README (Zenodo badge) + the manuscript ("Code and data are archived
  at https://doi.org/10.5281/zenodo.xxxxx (v1.0)."). One line: **all-versions (concept)
  DOI in the README; version DOI in the paper.**
- **No-GitHub path:** upload a ZIP directly to Zenodo (or a domain repository): same DOI.
  (Zenodo is free up to 50 GB, per the BES guide.)
- **Tree recap, final:** + DOI badge. The build is complete.

### 6. Last checks (~1.5 min)
- **Colleague test:** send it to a colleague (or run it on a different computer) and see
  if it runs from the README alone ("it costs you a coffee"). Citation: editorial "But is
  the code (re)usable?", *Nature Computational Science* (2021),
  doi:10.1038/s43588-021-00109-9 (aside).

### 7. AI help (~6 min)
- Framing: **AI helps in two ways** when preparing a repo for publication; it does not
  replace judgment.
- **Requirement first:** the AI needs access to your repository. IDE-integrated agents
  (Claude Code, GitHub Copilot), ChatGPT/Codex, or browser upload.
- **Way 1: draft the README.** AI easily lists files, what they do, inputs/outputs; you
  need a good prompt saying what the README should look like. Take-home: the
  README-drafting prompt (slide shows it running or the prompt itself).
- **Way 2: audit the repo against the criteria of this lecture.** Honest limits: AI is
  not good at deterministic checks (licence there or not); it is good at "is this README
  sufficient", "is anything missing". Use with the checklist + your judgment.
- **The in-development tool:** reads your repo, writes a prioritised, actionable report
  of what to fix before publishing; usable as a copy-paste prompt or an agent skill.
  Audience-facing language only, no builder-speak. One honest in-progress caveat.
  **Demo form OPEN (decide after testing the repo reviewer): screenshots vs recording;
  live demo only as a bonus. Slides must not depend on the tool being ready.**

### 8. Close (~2.5 min, the lecture ENDS here, not on the AI section)
- Progress over perfection; the **minimum publishable repo** target; final tree once more.
- **The checklist, shown once** (not built up during the talk): "everything we did today
  as a checklist you can cross off", on the session page, link/QR.
- Take-homes on the website: checklist · README prompt · audit prompt · resources list.
- Optional single FAIR name-drop line.
- Next-lecture slide (date/topic or summer-break note: todo) + thanks.

## Timing summary

Intro 6.5 · S1 structure 6 · S2 rerun 6 · S3 data 4.5 · S4 licence+citation 6 ·
S5 archive 6 · Last checks 1.5 · AI 6 · Close 2.5 = **~45 including the opener.**
At the safe end of the 44-46 target for a slow online pace, before Q&A.
First candidates to compress at rehearsal: `CITATION.cff` beat, second file-name slide.

## Teaching pattern

- **THE RED THREAD: building the repo.** One fictional example repo assembled across the
  whole lecture; recurring tree slide per section with `<- new` markers; DOI badge as the
  final build step. A build, not a cleanup. (Decision 2026-07-14, replaces the earlier
  messy-repo-cleaning thread.)
- **Checklist policy (decision 2026-07-14):** NOT built up on slides. It lives on the
  website as extra material, includes the last-look items, and is shown once + linked at
  the close. (Replaces the earlier growing-checklist mechanic.)
- **Ladders (levels of fancy):** run order, dependencies, citation: teach minimum →
  better → one-line pointer to the fancy option. Reassures beginners that the minimum
  counts, gives advanced listeners a next step.
- **Tabs (panel-tabset) for R/Python examples where applicable** (run order, paths,
  seeds, dependencies). Fits the series style.
- **Bad → good contrasts stay local** (file names, `setwd()`, the three data statements,
  the release-flow screenshots). Everywhere else, concise slides.
- **Items vs artifacts rule:** an item lives in exactly one section; an artifact (the
  README) can host items from several. Tie-break for placement: permission/credit → §4;
  data → §3; archiving/access → §5; else "what is this" → §1, "how do I run it" → §2.
- **Slides only, NO live cleaning/building during the talk** (online + beginners + Webex).
- **Optional upgrade (2-3 h at home, zero lecture minutes):** build the example repo for
  real (GitHub + Zenodo). Double-pays: source for the section-5 screenshots, the DOI on
  the slide becomes real, "browse the repo" becomes a take-home link. Skip without guilt.

## Slide visuals & assets

**Design rule: every content slide carries at least one of** (a) a real artifact (file
tree, file content, UI screenshot), (b) a before/after contrast, (c) a small
diagram/decision tree, or (d) the recurring repo tree. No decorative images. **Less text
than the first draft: one idea per slide.**

In the deck, every missing image is a visible `::: {.callout-note}` **IMAGE PLACEHOLDER**
block stating exactly what to capture. They render; swap for real `![](...)` later.

**Images that already exist in Selina's Obsidian vault** (export to
`slides/images/2026_07_16_code-sharing/` before rendering):
1. Screenshot of the Cooper et al. paper (title/abstract)
2. Screenshot of Cooper et al. Figure 1
3. Screenshot of `sessionInfo()` / `devtools::session_info()` output
4. Codebook example table

**Still to capture (placeholders in deck):** annotated real README example (§1) ·
choosealicense.com (§4) · cffinit form (§4) · GitHub "Cite this repository" button (§4) ·
Zenodo GitHub toggle, release form, Zenodo record with DOI, README DOI badge (§5, capture
all four in one session by archiving a small real repo) · AI screenshots (§7, form open).

**Built in-deck (no image files):** the recurring repo tree (text blocks), README
skeleton, the three data statements, codebook table (if not image), licence table (code
vs data), ladders, Mermaid data decision tree, MIT full text.

**On-slide links (max 1-2 per section):** choosealicense.com · cffinit · Zenodo
GitHub-integration guide · one-liner pointers (`here`, `renv`, `targets`) · session-page
link/QR at the close.

**Resource slide / handout** (links verified 2026-07-14 unless noted):
- Cooper et al. (2026), *Methods in Ecology and Evolution*, doi:10.1111/2041-210X.70338
  (the evidence hook; preprint CC BY 4.0 on EcoEvoRxiv).
- **BES Guide to Reproducible Code**, 2nd edition, now a Quarto book:
  <https://bes-guide.github.io/reproducible-code/> (chapters: organising projects,
  programming, code review, notebooks, version control, publishing and archiving).
  Perfect audience fit, same society as the hook.
- The Turing Way: <https://book.the-turing-way.org/> (licensing chapters).
- choosealicense.com · cffinit (`https://citation-file-format.github.io/cff-initializer-javascript/`)
- GitHub Docs, Zenodo integration:
  <https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content>
- Rocker project (Docker for R): <https://rocker-project.org/>
- `pyprojroot` (the Python `here`) · `here` · `renv` · `targets` · snakemake
- Jenny Bryan, file naming talk.
- "But is the code (re)usable?", *Nature Computational Science* (2021),
  doi:10.1038/s43588-021-00109-9 (colleague test).
- fair-software.eu ("a simple starting point") · reproai.org (verified live) ·
  rigor.me (ONLY if Selina's manual check passes).
- Citation-advantage evidence (speaker notes): Colavizza et al. (2020), PLOS/BMC data
  sharing ~25%; code-sharing evidence thinner and field-dependent.

## Standing decisions (compressed log, revisions 1-4)

- Time target ~45 (was ~54 raw); online-with-beginners pace.
- **Lecture ends on the close (checklist + take-homes), never on the AI section.**
- **Red thread = building the repo** (2026-07-14; replaces cleaning-a-messy-repo).
- **Checklist on the website only, shown once at the close** (2026-07-14; replaces the
  per-section growing checklist).
- **Zenodo workflow order corrected:** enable integration BEFORE the release; DOI minted
  automatically. Must survive into the slides.
- **Code quality = one reassurance slide** ("not a gate") + link to *R code that lasts*.
- **Secrets topic cut**; sensitive-data last look = **checklist items only, no slide**
  (2026-07-14).
- **Dependencies Level 2 lists both flavours:** DESCRIPTION ("record what", Selina's own
  workflow) and `renv.lock` ("record exact versions") (2026-07-14).
- **Containers stay a one-liner** + resource-list pointer (2026-07-14 confirmed).
- **Licence default = MIT** (permissive), GPL-3 named as the copyleft alternative;
  resolved from the literature 2026-07-14. Slide must say MIT requires attribution and
  that no licence compels citation.
- **Zenodo: link the official how-to, do not walk through it theoretically**
  (2026-07-14). One slide with the four steps in the correct order + the GitHub Docs link.
- FAIR cut from the talk; optional name-drop at the close only.
- AI section: two-ways framing (canvas version adopted, better than the old tool-centric
  plan); demo form open; portable prompt tool-independent; no builder-speak.
- Tabs (panel-tabset) for R/Python examples adopted (2026-07-14).
- Bad examples always invented; good examples always real (CODECHECK register etc.).
- Example-repo real build = optional upgrade, zero lecture minutes.

## Open items: RESOLVED in the check pass (2026-07-14)

1. **Python paths:** `pathlib` + run from the project root; `pyprojroot` (or `pyhere`) is
   the direct `here` equivalent. → folded into §2.
2. **Python run-everything script:** `main.py` (or `run_analysis.py` / `runall.py`); no
   single blessed name, `main.py` mirrors `main.R` nicely. → §2.
3. **Python seeds:** `np.random.default_rng(seed)` is the current NumPy recommendation;
   `np.random.seed()` is legacy global state. `random.seed()` for plain Python. → §2.
4. **Install commands:** `pip install -r requirements.txt`;
   `conda env create -f environment.yml`. → §2.
5. **Docker for R:** the **Rocker project** (rocker-project.org) is still the reference
   (ready-made images, version tags; Dockerfile usually calls `renv::restore()`). No
   newer standard package found; `containerit` exists but is not needed at one-liner
   depth. → resource list + §2 Level 3.
6. **pak command:** `pak::local_install_deps()` (VERIFIED: installs the hard deps of the
   package tree at `root = "."`; `local_install_dev_deps()` also installs Suggests). → §2.
7. **Typos to fix when drafting** (from the canvas): `dev::session_info()` →
   `sessionInfo()` or `devtools::session_info()`; `usethis::use_licence()` →
   `usethis::use_mit_license()`; "analyiss" → "analysis"; "requirments.txt" →
   `requirements.txt`; "envrionment.yml" → `environment.yml`; "choosealicence.com" →
   choosealicense.com.
8. **Licence default: MIT** (permissive), with GPL-3 named as the copyleft alternative.
   Consensus in research-code guidance is permissive-by-default for academic code (lowest
   barrier to reuse; NumPy/SciPy/pandas/matplotlib are BSD/MIT). Note the BES guide itself
   names NO default, it defers to the Software Sustainability Institute and The Turing Way,
   so "MIT unless your group says otherwise" is a defensible teaching default rather than a
   quotable rule. **Key correction to state on the slide: MIT DOES require attribution;
   no licence can compel citation.** → §4.
9. **GPL + data:** data never goes under GPL. Code licence for code, CC licence (CC0 /
   CC-BY) for data, stated in the README. Creative Commons explicitly recommends against
   CC licences for software. → §4.
13. **Benefits/citation claim:** honest phrasing, data-sharing citation advantage is
    well-replicated (Colavizza et al. 2020, ~25%), code-sharing evidence is thin and
    field-dependent. Do not promise citations for code. → intro.
14. **Cooper et al. figure:** the **preprint on EcoEvoRxiv is CC-BY 4.0**, so Figure 1 is
    reusable with attribution. Safest: take the figure from the CC-BY preprint version and
    put a credit line in the slide `aside` ("Figure from Cooper et al. (2026),
    doi:10.1111/2041-210X.70338, CC BY 4.0"). Headline stat confirmed: **only 35% of
    papers that used code archived it** (vs 97% for data); about a third of papers with
    archived data/code had no README; >85% of archived material could be located,
    downloaded and opened.
15. **Zenodo how-to link (per Selina's decision, no theoretical walkthrough):** GitHub
    Docs, "Referencing and citing content", section "Issuing a persistent identifier for
    your repository with Zenodo". VERIFIED to give exactly the right order (authorize
    Zenodo with GitHub → toggle the repo On → then create the release). Repo must be
    public. Does NOT cover `CITATION.cff` (link cffinit / GitHub's "About CITATION files"
    for that). → §5.

## Open items: STILL OPEN

10. **Pick the real README example repo** for §1. The CODECHECK register is verified-good
    but currently engineering-heavy (control systems, UAVs), so it may not resonate with a
    bio/pharma audience. Candidates to look at when drafting: ReproHack Hub,
    `annakrystalli/rrcompendium-complete` (teaching-grade compendium), the repo_reviewer
    corpus (`corneliushennch/prethod_data_wrangling`, `MICA-MNI/micaflow`). **Any decent
    real README works; do not over-optimise.** Slide carries a placeholder until picked.
11. **Polish the README skeleton** (canvas draft is a good base): done at drafting.
12. **Date-ordering file-name example:** trivial, written at drafting
    (`2023-04-20_temperature_almeria.csv` sorts correctly; `20.4.2023 temp.csv` does not).
16. **Next-lecture slide** content (date/topic or summer-break note): Selina.
17. **AI demo form** (screenshots vs recording vs live) and whether the tool's own
    prompt-path ships: decide after testing the repo reviewer. Slides carry a placeholder
    and must not depend on the tool being ready.
18. **rigor.me:** manual check by Selina (403 to automated fetch). Include on the resource
    list only if it checks out. (`reproai.org` verified live earlier.)
