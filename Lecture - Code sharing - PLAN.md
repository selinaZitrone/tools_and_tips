# Lecture plan: Good practices for sharing research code

> Working plan for the 1-hour lecture (~46 min content + Q&A) in the
> *Scientific Workflows: Tools and Tips* series. Feeds the Fable drafting prompt.
> Companion to the fixed workshop description in `Lecture - Code sharing.md`.
> Revision 3: structure merged from Selina's item inventory (2026-07-13).

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
- **Scope:** language-agnostic, about **data-analysis repositories** (not scientific
  software). Concrete tips; R / Python / IDE pointers stay *one-liners*, no deep-dives.
  Focus is the project around the code (structure, data, licence, archive), not code polish.
- **Overlap with earlier decks is fine and often useful**: the last relevant lecture was
  ~1 year ago and the audience has largely turned over. Re-use good existing material
  where it serves the talk; the fresh publication-readiness content still gets the bulk
  of the time.
- **Keep everything practical and actionable, not theoretical.** Every point should give the
  audience something they can *do* to their own repository: a concrete step, a file to add,
  a command, a setting to change, a before/after. Prefer showing a real example over
  explaining a concept. If a point can't be turned into an action, it probably doesn't belong.

## Through-line

**Minimum publishable repository: what to have in place before you share.** Five sections,
each a category with a reuser question as its subtitle, each ending by adding items to a
growing checklist. The audience leaves knowing *how much is enough*, not a long list of
best practices.

Two reassurances stated early and kept in view:
- **Shareable ≠ perfect.** Published code needs to be understandable, rerunnable enough,
  documented, and safe to release: not elegant or package-quality.
- **"No shareable data" ≠ failure.** There is an acceptable path for restricted/sensitive
  data (see section 3).

## Relationship to existing lectures (what's new here)

Already covered in earlier lectures (re-use what's good; the audience has largely changed since):
- `2025_05_15_r-code-that-lasts`: project structure, file naming, `here`/paths, script
  structure, style/`lintr`, modularization, DRY/functions, `renv`.
- `2023_07_20_research_compendia`: the compendium concept; data/methods/output separation;
  licence/DOI/version-control at a high level.

**Fresh contribution of this lecture:** the *publication-readiness* lens + data availability
& codebooks (incl. the sensitive-data reality), code + data **licensing**, citation
(README minimum + **`CITATION.cff`** upgrade), the concrete **GitHub → Zenodo-switch →
release → DOI** workflow, the **portable audit prompt**, and the **AI repository
reviewer** demo.

## Deliverables (produced by Fable as the plan is executed)

1. Slide deck `.qmd` (revealjs, series template).
2. Session landing page `sessions/##_code-sharing.qmd`.
3. One-page **repository checklist** handout: its spine is the 5 sections below.
4. **Portable audit prompt**: a *generic, tool-independent* copy-paste prompt the audience
   can run with any AI tool. **Must not depend on the in-development tool being ready** (the
   description promises it). If the tool's own prompt-path ships too, great; this generic one
   is the guarantee.
5. **Resources/tools list**: a real planned resource slide + handout section (not a
   takeaways afterthought). Note: `rigor.me` / `reproai.org` are in the *private notes*,
   not the published description text; optional includes, not promises. `reproai.org`
   verified live ("plugin for reproducible replication packages"); **`rigor.me` must be
   verified manually** before it goes on a slide (403 to automated fetch).

---

## Section-by-section outline (~46 min)

Section headers on slides: **noun + question subtitle**, e.g.
`# Data · Can someone understand the data situation?`. The noun gives the category feel
(consistent with the repo_reviewer taxonomy), the question carries the "why".

### 0. Intro (~6 min: 1.5 series slide + 4.5 motivation)
- **Series-intro slide** (standard opener, explicitly budgeted).
- **Evidence hook:** code sharing and archiving is still not the norm, at least in ecology
  and evolution: Cooper et al. 2026 (BES journals, data 2017-2024) + figure from the paper.
  Exact citation, the stat to quote, and the figure licence: see Open items.
- **Messy-folder beat, fast (~30 s):** the organically grown folder tree; the day you must
  share it (journal, collaborator, new lab member, future you).
- **Why share, max 4 bullets** (collapsed from the draft's five overlapping ones):
  reproducibility and greater faith in the research · others can build on it instead of
  starting over · credit, collaboration, visibility · future you can pick the project up
  again.
- **Today + scope slide(s):** shareable ≠ perfect, so we focus on minimum requirements;
  the growing checklist you take home; roadmap of the 5 sections; scope lines (data-analysis
  repos, language-agnostic with one-line R/Python pointers, the project not the code);
  one reassurance line: "can't share your data? there is an accepted path (Data section)";
  name the three take-homes.
- **FAIR is cut from the talk** (the published description never promises it). Optional:
  one name-drop line at the take-aways ("this is FAIR4RS in practice"); citations only on
  the resource list if that line stays.

### The body: 5 sections (~29 min), each ending by adding its items to the growing checklist

**1. Structure & orientation · Can someone understand it? (~5 min)**
- **Bad → good folder tree** (beat 1 of 3): separate data, analysis/methods, output;
  clear conventional structure; README at top level.
- **Informative file names**: brief re-use from earlier deck.
- **README contents** (the container artifact; expanded list from Selina's draft):
  purpose + link to the manuscript · contact details · how to cite (minimum citation home) ·
  which data/code files reproduce which figures/tables · list of scripts and what they do ·
  what to run in which order (pointer, taught in section 2) · software used.
  Show a **README skeleton** block + an **annotated real README screenshot**.
- Rule stated once: the README is a container; later sections add lines to it.

**2. Running it · Can someone rerun it? (~5 min)**
- **Run-order ladder (levels of fancy, from Selina's draft):** numbered file names →
  "How to run" section in the README → `main.R` / `run.py` that calls everything →
  one-liner: workflow tools (`targets`, snakemake) exist when you outgrow this.
- **No absolute paths**: `setwd()` / hard-coded paths bad → relative paths; one-liner for
  RStudio projects / `here`.
- **Dependencies ladder:** minimum = versions listed in the README (`sessionInfo()` /
  `pip freeze`) → better = `renv.lock` / `requirements.txt` / `environment.yml` + language
  version → one-liner: containers exist, not today's topic.
- **Seeds** for anything stochastic (one line).
- Code *quality* (style, modularity, DRY) is **not a sharing gate**: one line + link to the
  *R code that lasts* session page.

**3. Data · Can someone understand the data situation? (~5 min)**

**SCOPE RULE (decided 2026-07-13):** this is a *code*-sharing lecture and the fixed
description never promises data sharing. Section 3 is therefore NOT "how to share data".
It is one narrow thing: **the repository states what the data situation is**, because the
first question any code-downloader asks is "where do I get the data?". Filter for every
item: *does it produce a line in the repo?* If not, cut it. (Repository choice, metadata
standards, embargoes, GDPR: all out. One closing aside teases "data sharing is its own
lecture", a future-topic hook.) Trimmed from 7 to 5 min; **the 2 min are banked as buffer**,
not reassigned, taking planned content to ~44 min.

- **Why-a-data-slide-in-a-code-lecture opener** (one slide, ties back to the Cooper figure:
  data archiving is already near-universal; the gap is connecting code to it).
- **Three honest paths (beat 2 of 3), as a Mermaid decision tree:** open / restricted /
  cannot be shared. Punchline: "I can't share my data" is not a dead end; path 3 is a valid
  publishable repository (the reassurance beat for medicine/pharmacy).
- **Each path as a README line**: show all three as concrete statement text, with the
  **restricted** one the fullest (it is the one nobody knows how to write).
- **Codebook, pitched as "the README for your data"**: small example table; the open-format
  line (`.csv` not `.xlsx`; a PDF is not data) folded in here, not a separate beat.
- **Last look**: file names + column headers scan (patient IDs, stray confidential files),
  plus junk removal. Carries the realistic remnant of the dropped secrets topic.
- **Cut to one line / resource list:** where to put data (Zenodo/Dryad, the 100 MB GitHub
  limit, the 50 GB Zenodo limit). Raw vs. processed: checklist line only.

**4. Licence & citation · Can someone legally reuse and cite it? (~6 min)**
- **Code licence**: "no licence = all rights reserved = nobody may legally reuse it."
  Be decisive for beginners: **if unsure, MIT** ("unless your group/funder says otherwise");
  choosealicense.com for the rest. (No licence-taxonomy lecture.)
- **The common trap, explicit:** CC licences are for **data/text/figures**, not code;
  MIT/Apache are for **code**. One repo with code + data usually needs **two licences**.
  Data licence: CC0 / CC-BY.
- **Citation, taught as minimum → upgrade** (user decision): minimum = a "How to cite"
  section in the README (fully legitimate); upgrade = **`CITATION.cff`** (~5 min effort:
  `cffinit` generates it, GitHub renders a "Cite this repository" button, Zenodo picks up
  the metadata when archiving a release). One-line ORCID mention.
  *First candidate to compress to one line if rehearsal runs long.*
- **VERIFIED 2026-07-13:** Zenodo does parse `CITATION.cff` on GitHub-release archiving
  (fields: title, authors, licence, abstract, keywords). Speaker-note caveat only, NOT on
  the slide: if a `.zenodo.json` is also present it takes precedence and the `.cff` is
  ignored. Source: help.zenodo.org/docs/github/describe-software/citation-file/
- **Full MIT licence text shown on one slide** (it is short: that is the point) + the
  GitHub "Choose a license template" path, so the action is concrete.

**5. Archive & publish · Can someone find the exact version you used? (~6 min)**
- **GitHub alone is not archiving**: repos are mutable and deletable; great for living
  code, not a frozen citable record. (Merged from the draft's duplicate "Archiving" item
  and "Where and how to share it" section.)
- Learning Git is encouraged; the web "upload files" button is a valid low-barrier entry.
  *No Git tutorial.*
- **The concrete workflow (beat 3 of 3), as screenshots. ORDER MATTERS (Zenodo only
  archives releases made *after* the switch is on; the DOI is minted automatically):**
  repo on GitHub with metadata files in (LICENSE, README, `CITATION.cff`) →
  **enable the repo on Zenodo (GitHub integration toggle)** → **create a release/tag** →
  DOI appears automatically → put the DOI / citation in the README + manuscript.
- One line: **all-versions (concept) DOI in the README; version DOI in the paper.**
- **No-GitHub path**: upload code+data directly to Zenodo (or a domain repository).

### 6. Before you hit publish: colleague test + full checklist (~2 min)
- NOTE: the sensitive-data/junk **last look moved INTO section 3** during drafting (it fit
  the data flow); §6 no longer repeats it, just references it. (Secrets topic cut entirely,
  user decision.)
- **Ask a colleague to run it from scratch, README only** ("it costs you a coffee").
  Citation RESOLVED: editorial "But is the code (re)usable?", *Nature Computational
  Science* (2021), doi:10.1038/s43588-021-00109-9.
- **The complete checklist on one slide** (two columns, small font, 18 items incl. the
  colleague test): the payoff of the growing-checklist thread, and a 1:1 preview of the
  handout.

### 7. AI help: repository reviewer + portable prompt (sidecar, not climax) (~6 min)
- Framing: "a helper that runs this checklist *for* you; it does not replace judgment."
- **Audience-facing only, no builder-speak.** Four things: what it does (reads your repo,
  writes a plain-language prioritised report of what to fix before publishing), **one real
  finding with evidence** (path/line), **one limitation**, one honest in-progress caveat.
- **Recording / screenshot walkthrough is the plan of record**; live demo only as a bonus.
- **Portable prompt beat (~1 min):** "whatever AI tool you use, paste this": show the
  generic prompt + a screenshot of it running in a plain chat window.
- **Do not end the lecture on the tool.**

### 8. Checklist & take-aways (~3 min, the lecture ENDS here)
- Progress over perfection; the **minimum publishable repo** target.
- Full checklist on screen (the audience watched it grow).
- The three take-homes: the **checklist**, the **portable audit prompt**, the
  **resources/tools list**; link/QR to the session page hosting all three.
- Optional single FAIR name-drop line here.

---

## Teaching pattern

**THE RED THREAD: one repository, fixed live across the whole lecture.**
The messy folder introduced in the intro (`phd_analysis/`, the code behind the fictional
paper *"Temperature and antibiotic resistance in soil bacteria"*) is the SAME repository
that every section improves, and it ends the talk with a DOI. Two artifacts accumulate in
parallel and carry the narrative:
- **the repo tree** grows section by section (structure + README → run order + `renv.lock`
  → `data/` + codebook → LICENSE + `CITATION.cff` → release + DOI badge),
- **the checklist** grows alongside it (see below).
Every "after" tree is a text block, so this costs no images. The messy-vs-final tree
contrast lands at the END OF SECTION 5 (where the repo work completes: the natural climax
of the fix journey); section 8 closes on the full checklist + take-homes instead.
Name/topic of the example repo is easy to swap if a different field fits the audience better.

**Red-thread execution decisions (2026-07-13, user confirmed):**
- **Slides only, NO live cleaning during the talk** (10-15 min of screen fiddling for the
  toy repo alone; online + beginners + Webex; same reasoning that made the AI demo a
  recording). Intro framing softened accordingly ("watch it improve", not "we fix it
  together").
- New lines in each after-tree carry a `<- new` marker so the delta is visible at a glance.
- **Optional upgrade (2-3 h at home, zero lecture minutes):** build the example repo for
  real (before state as a tag, cleaned state as main), archive it to Zenodo. Double-pays:
  it IS the source for the four section-5 screenshots, the DOI on the slide becomes real,
  and "browse the before/after" becomes a fourth take-home link. Skip without guilt if the
  week fills up.

- **Growing checklist:** each section ends by adding its 2-4 items to a recurring
  "your checklist so far" slide. The §6 completion is an assembly the audience watched
  grow, and it matches the handout 1:1.
- **Ladders (levels of fancy):** for run order, dependencies, and citation, teach
  minimum → better → one-line pointer to the fancy option. Reassures beginners that the
  minimum counts, gives advanced listeners a next step.
- **Bad → good contrast only for the 3 highest-value beats:** folder tree / README
  (section 1), data decision tree + restricted-data statement (section 3), the release
  flow screenshots (section 5). Everywhere else, a concise checklist slide.
- **Items vs. artifacts rule:** an item lives in exactly one section; an artifact (the
  README) can host items from several. Tie-break order for placement: permission/credit →
  section 4; data → section 3; archiving/access → section 5; else "what is this" →
  section 1, "how do I run it" → section 2.

## Slide visuals & assets

**Design rule: every content slide carries at least one of** (a) a real artifact (file
tree, file content, UI screenshot), (b) a before/after contrast, (c) a small
diagram/decision tree, or (d) the growing checklist. No decorative images.

In the deck, every missing image is a visible `::: {.callout-note}` **IMAGE PLACEHOLDER**
block that states exactly what to capture and what to annotate. They render, so nothing
breaks; swap each for the real `![](...)` when the screenshot exists.

**Example-repo policy (decided 2026-07-13):**
- **Bad examples: always invented.** Never show a real, nameable researcher's weak repo.
  The red-thread `phd_analysis/` folder is fictional, which is what makes it safe to mock.
- **Good examples: always real.** A real published compendium proves this happens in
  practice, and naming it is a compliment. Sources to pick from:
  [CODECHECK register](https://codecheck.org.uk/register) (60+ papers whose code was
  independently executed: strongest "verified good" signal),
  [ReproHack Hub](https://www.reprohack.org/) (author-submitted papers WITH reproducibility
  scores from participants),
  [BES *Guide to Reproducible Code*](https://assets.britishecologicalsociety.org/2025/12/BES-Reproducible-code-guide_2025.pdf)
  (same society as the Cooper hook),
  `annakrystalli/rrcompendium-complete` (teaching-grade compendium),
  FRB-CESAB / `rdatatoolbox`, or a repo from the repo_reviewer corpus
  (`corneliushennch/prethod_data_wrangling`, `MICA-MNI/micaflow`).

**Screenshots for Selina to capture** → `slides/images/2026_07_16_code-sharing/`:

| File | Content | Used in |
|---|---|---|
| `cooper-2026-figure.png` | Figure from Cooper et al. 2026 | Intro hook (DONE, in place) |
| `readme-good-example.png` | A REAL published repo's README on GitHub, annotated: purpose+paper link, how-to-run, data note, citation/licence | Section 1 |
| `choosealicense.png` | choosealicense.com front page | Section 4 |
| `cffinit-form.png` | cffinit web form filled in | Section 4 |
| `github-cite-button.png` | Repo with "Cite this repository" open | Section 4 |
| `zenodo-github-toggle.png` | Zenodo GitHub-sync page, switch ON | Section 5 |
| `github-release-form.png` | "Draft a new release" form | Section 5 |
| `zenodo-record-doi.png` | Archived Zenodo record with DOI | Section 5 |
| `readme-doi-badge.png` | README with DOI badge | Section 5 |
| `reviewer-report.png` | repo_reviewer report (or recording stills) | Section 7 |
| `prompt-in-chat.png` | Portable prompt running in a plain AI chat | Section 7 |

Tip: capture the four section-5 screenshots in one session by actually archiving a small
real repo end-to-end; the screenshots stay consistent and the DOI is real.

**Built in-deck (no image files needed):** text folder trees (bad/good), README skeleton
code block, codebook example table, licence table (code vs. data), run-order ladder,
data decision tree (Mermaid, native in Quarto), `renv.lock` vs `requirements.txt`
side-by-side snippet, the full MIT licence text on one slide (shows how short it is),
growing checklist.

**On-slide links (max 1-2 per section):** choosealicense.com · cffinit ·
Zenodo GitHub-integration guide · one-liner pointers (`here`, `renv`, `targets`) ·
session-page QR at the end.

**Resource slide / handout:** Cooper et al. 2026 · BES *Guide to Reproducible Code in
Ecology and Evolution* (same society as the hook, perfect audience fit) · The Turing Way ·
fair-software.eu (framed as "a simple 5-step starting point") · reproai.org · rigor.me
(only if manually verified) · J. Bryan file-naming talk · Nature colleague-test source ·
Wilkinson 2016 / Barker 2022 only if the FAIR name-drop stays.

## Timing summary
Intro 6 · S1 structure 5 · S2 rerun 5 · S3 data 5 · S4 licence+citation 6 ·
S5 archive 6 · Last look 2 · AI + prompt 6 · Take-aways 3 = **~44 including the opener**.
The 2 min freed by the section-3 scope cut are **deliberately banked as buffer** (not
reassigned): ~44 is the safe end of the 44-46 target for a slow online pace, before Q&A.

## Design decisions (from the first critical review, GPT)
- **5-question spine** replaced the earlier 4-questions-plus-bolted-on-extras.
- **Time target cut to ~46** (was ~54 raw: unrealistic live/online).
- **FAIR compressed to one slide** (later cut entirely, see revision 3).
- **AI tool de-climaxed**, recording-first; lecture ends on the checklist/takeaways.
- **Portable prompt made tool-independent** so the published promise holds regardless of
  the tool's readiness.
- **Resources list is a planned deliverable**, not an afterthought.
- **Sensitive/unshareable-data handled concretely (3 paths)**: a real concern for this
  audience, weighted as one section among five, not a centrepiece.
- **Re-using good material from earlier decks is welcome** (audience largely turned over).

## Design decisions (from the second critical review, Fable, 2026-07-13)
- **Zenodo workflow order corrected** (was factually wrong): enable the integration
  *before* creating the release; Zenodo does not retro-archive, and the DOI is minted
  automatically. The old order (release → enable → "mint") would leave beginners with a
  release and no DOI.
- **Code-quality material (style/modularity/DRY) cut from the rerun section**: it
  contradicted "shareable ≠ perfect" and re-taught *R code that lasts*; now one line +
  session-page link.
- **Secrets topic removed entirely** (user decision): rare in this audience's repos,
  unfamiliar jargon. The sensitive-data last look covers the realistic risk.
- **Portable prompt got ~1 min of slide time** in §7: a published take-home shouldn't
  exist only as a handout link; it also hedges the demo.
- **Licensing trap made explicit** (CC for data/text/figures, MIT/Apache for code) and a
  decisive default named (MIT).
- **Series-intro slide explicitly budgeted**; timings rebalanced to ~46 incl. opener.
- **Data-size reality added** (GitHub 100 MB file limit → Zenodo/Dryad).
- **Growing-checklist teaching mechanic adopted** (assembly, not reveal).
- **AI-tool section stripped of builder-speak**; recording is the plan of record.
- **fair-software.eu correction:** its five one-action steps do NOT map onto the five
  sections (no README, no data); demoted to the resource list as "a simple starting point".

## Design decisions (revision 3: structure merge, 2026-07-13)
- **Selina's flat item inventory adopted as the content source**; it self-sorted onto the
  five groups. **Noun + question section headers** adopted: category feel of the
  repo_reviewer taxonomy, question pedagogy of the checks.
- **Cooper et al. 2026 evidence hook** opens the talk (code archiving still rare in
  EcoEvo); **FAIR slide cut** (never promised in the description), optional name-drop at
  take-aways only.
- **Restored items the draft had dropped** (all promised or audience-critical): the three
  data paths + "can't share ≠ can't publish" reassurance, `CITATION.cff`, the concrete
  Zenodo workflow, codebook, seeds.
- **Citation taught as minimum → upgrade** (user question resolved): README "How to cite"
  section is the legitimate minimum; `CITATION.cff` is the cheap upgrade (GitHub button +
  Zenodo metadata). First candidate to compress if long.
- **Draft's duplicate "Archiving" item and "Where and how to share it" section merged**
  into one Archive & publish section.
- **Ending re-fixed**: the draft ended on AI tools, violating the firm constraint; the
  checklist/take-aways close the lecture.
- **Run order, dependencies, citation taught as ladders** (levels of fancy), per the draft.
- **Slide-visuals rule + asset list added** (see "Slide visuals & assets").

## Open items
- ~~Exact Cooper citation + stat~~ DONE: Cooper et al. (2026), *Methods in Ecology and
  Evolution*, doi:10.1111/2041-210X.70338. 1861 papers, 7 BES journals, 2017-2024.
  **Only 35% of papers that used code archived it**; **about a third had no README**.
  Figure is in place. Still to confirm: the **figure licence** for re-use (BES journals are
  usually CC-BY; check and add the credit line to the slide's `aside`).
- ~~Nature colleague citation~~ DONE: *Nature Computational Science* editorial (2021),
  doi:10.1038/s43588-021-00109-9 (on the slide's aside).
- Confirm the **next-lecture slide** (date/topic or summer-break note): TODO marker in deck.
- **Manually verify `rigor.me`** before the resource slide (`reproai.org` verified live).
- Confirm Zenodo's `CITATION.cff` metadata pickup at drafting (one-line claim in section 4).
- Confirm whether the tool's own prompt-path ships by the lecture (independent of
  deliverable 4).
- **Pick the real README example repo** for section 1 from the sources listed above
  (CODECHECK register is the best starting point).
