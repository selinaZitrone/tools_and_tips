# CLAUDE.md — Tools and Tips Lecture Series

## Project Overview

This repository contains the materials for **"Scientific Workflows: Tools and Tips"**, a monthly lecture series by Selina Baldauf at Freie Universität Berlin. The series teaches researchers practical tools and workflows for scientific computing. Materials are published as a Quarto website at https://selinazitrone.github.io/tools_and_tips/.

## Audience

- Primarily **PhD students** in biology, pharmacy, and medicine
- Mixed skill levels — many beginners, but advanced topics are also offered
- Assumed to be working in R and/or Python, but not necessarily experienced programmers

## Session Format

- **Standard session**: 1 hour — ~45 min talk/live demo + ~15 min Q&A
- **Planned expansion**: 2-hour hands-on workshops (in development)
- **Schedule**: Monthly, every **3rd Thursday, 4–5 p.m.**
- **Delivery**: Webex (online)
- Format varies by topic — some sessions are slide-heavy, others are primarily live demos

## Tone & Style

Between casual and academic. Approachable and practical, but technically accurate. English only.

## Existing Sessions

The following 16 sessions have already been created (do not suggest these as new topics):

| # | Title |
|---|-------|
| 01 | What they forgot to teach you about R |
| 02 | Reproducible documents with Quarto |
| 03 | Version control with Git |
| 04 | Research compendia as R packages |
| 05 | Effective digital notetaking with Obsidian |
| 06 | Efficient R |
| 07 | AI tools in programming |
| 08 | Tidyverse introduction |
| 09 | Data visualization |
| 10 | Write R code that lasts |
| 11 | Efficient R (update) |
| 12 | Version control with Git (update) |
| 13 | Reproducible documents with Quarto (update) |
| 14 | Effective digital notetaking with Obsidian (update) |
| 15 | GitHub Copilot |
| 16 | Version control with Git (advanced) |

## Repository Structure

```
tools_and_tips/
├── sessions/          # One .qmd per session (landing page with summary, slides embed, further reading)
├── slides/            # One .qmd per session (revealjs slide deck)
├── style/             # Custom SCSS themes
├── R/                 # Automation scripts (pipeline.R renders site and pushes to GitHub)
├── docs/              # Built website output (do not edit manually)
└── _quarto.yml        # Website configuration and navbar
```

### Naming Conventions

- Session files: `sessions/##_short_name.qmd` (e.g., `sessions/17_new_topic.qmd`)
- Slide files: `slides/YYYY_MM_DD_short_name.qmd` (e.g., `slides/2026_04_17_new_topic.qmd`)
- Images for a slide deck go in: `slides/images/YYYY_MM_DD_short_name/`

### Slide YAML Template

New slide decks should use this YAML header:

```yaml
---
title: "Session Title"
subtitle: "Scientific workflows: Tools and Tips 🛠️"
date: "YYYY-MM-DD"
format:
  revealjs:
    footer: "Selina Baldauf // Session Title"
    highlight-style: printing
    mainfont: Cabinet Grotesk
    slide-number: true
    show-slide-number: all
    incremental: true
    self-contained: true
    code-line-numbers: false
    theme: slides.scss
    auto-stretch: false
editor: source
execute:
  echo: false
  eval: true
from: markdown+emoji
---
```

## How to Work with Claude on New Content

Use the following workflow when creating new sessions:

1. **Brainstorm**: Discuss topic ideas — Claude will suggest topics not already covered, suited to the audience
2. **Outline**: Agree on a session outline in the chat before any files are created
3. **Draft slides**: Once the outline is agreed, Claude will produce a `.qmd` slide file using the template above
4. **Session page**: Claude can also draft the `sessions/##_topic.qmd` landing page

When brainstorming topics, consider:
- What practical pain points do PhD students in life sciences commonly face?
- Does the topic fit in a 1-hour slot, or is it better as a 2-hour workshop?
- Is this a standalone topic or an update/continuation of an existing session?
