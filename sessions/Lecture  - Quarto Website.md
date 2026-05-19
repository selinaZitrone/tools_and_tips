---
created: 2026-04-01 09:17
tags:
  - note
  - project/ringvorlesung
topic:
summary:
project:
  - Ringvorlesung
---
## Build and publish your personal academic website with Quarto

In this hands-on workshop, we will build and publish your own academic website from scratch, step by step and together. We will use Quarto, a modern publishing tool that lets you create websites, blogs, and more from plain text files. By the end of the session, you will have a live website you can share with the world.

**Format**: 2-hour hands-on workshop, follow along at your own computer
### Requirements

Please make sure you have the following installed before the session:

- [RStudio](https://posit.co/download/rstudio-desktop/) (latest version), Quarto comes bundled so no extra install is needed

To publish your website, choose one of the following options and set it up **before** the session:

- **Option A: GitHub Pages** (recommended if you already use Git): You need a a [GitHub](https://github.com) account and Git installed and connected to your GitHub account
- **Option B: Quarto Pub** (easier, no Git needed): A free account at [quartopub.com](https://quartopub.com)

Both options give you a free, publicly accessible website. GitHub Pages gives you more control long-term; Quarto Pub is the easier route if you are new to Git.

***Using a different editor?***  *Positron works out of the box (Quarto comes bundled). For VS Code, install [Quarto](https://quarto.org/docs/get-started/) and the [Quarto VS Code extension](https://marketplace.visualstudio.com/items?itemName=quarto.quarto) separately.*

-----
Meeting link:
https://fu-berlin.webex.com/fu-berlin-en/j.php?MTID=m0b150c13b39cb4d4319bfd5fcd0a99ff

Meeting number:
2784 612 4170

Meeting password:
m8GmQEpCf64

Join from a video system or application
Dial 27846124170@fu-berlin.webex.com
You can also dial 62.109.219.4 and enter your meeting number.


Meeting password for video system
68467372

Join by phone
+49-619-6781-9736 Charged call
+49-89-95467578 Charged call
Access code: 27846124170


Global call-in numbers
https://fu-berlin.webex.com/fu-berlin/globalcallin.php?MTID=m2dde6a4b473a5840767402c7d2c80c59

Meeting password for audio
68467372

# Todos

- [x] Write notes on what to show ✅ 2026-04-14
- [x] Research materials and docs ✅ 2026-04-14
- [x] Build a template website ✅ 2026-04-14
- [x] Write outline ✅ 2026-04-15
- [ ] Make slides
- [ ] Make website entry with references, slides etc.
- [ ] De-Claude the template website
- [ ] Publish template website on GH and Quarto pub
- [ ] Practice once

# Materials

- [Get started with Quarto](https://quarto.org/docs/get-started/): Official Quarto docs for installing Quarto and basic tutorial
- [Create a Quarto website](https://quarto.org/docs/websites/): Official documentation on creating websites with Quarto. Shows everything from basics to more advanced things
- [List of HTML themes](https://quarto.org/docs/output-formats/html-themes.html): Overview of predefined themes
- [Customize and create about pages](https://quarto.org/docs/websites/website-about.html)
- [Listing pages for blogs, publication pages etc.](https://quarto.org/docs/websites/website-listings.html) 
- [Publishing Quarto websites](https://quarto.org/docs/publishing/): Describes different publishing options
- [Adding a blog to a Quarto Website](https://samanthacsik.github.io/posts/2022-10-24-quarto-blogs/): Blog post by Sam Shanny-csik

## Example pages

Overview with examples
https://drganghe.github.io/quarto-academic-site-examples.html 

| Page                             | Github Code                                            |
| -------------------------------- | ------------------------------------------------------ |
| https://www.andrewheiss.com/now/ | https://github.com/andrewheiss/ath-quarto              |
| https://www.jhelvy.com/projects  | https://github.com/jhelvy/jhelvy_quarto                |
| https://affcom.ku.edu/index.html |                                                        |
| https://silviacanelon.com/       | https://github.com/spcanelon/silvia                    |
| https://samanthacsik.github.io/  | https://github.com/samanthacsik/samanthacsik.github.io |

# Notes
- https://quarto.org/docs/websites/ -> Show how the Quarto Website is excellent with screenshots on how to get started etc.

- YAML is the config file
- Workflow
	- Write
	- Click render button -> Runs `quarto preview` so you can see the output
- What is rendered?
	- Everything except: hidden files, `_` prefix, AI files, README files
- Have a "More" section with
	- partials

# To show
- Linking:
```md
[about](about.qmd)
[about](about.qmd#section)
```

- Themes
```md
format:
  html:
    theme: cosmo
    css: styles.css
```

- Navbar
	- Can also be a sidebar, breadcrumbs, ...
```md
website:
  navbar:
    background: primary
    search: true
    left:
      - text: "Home"
        href: index.qmd
      - talks.qmd
      - about.qmd
```
- Footer
```md
website:
  page-footer: "Copyright 2021, Norah Jones" 
```
- About pages
- Listings
	- Publication list
	- Blog
- Publish
	- Posit connect
	- Github pages
## Maybe show
- 404.qmd

# Session outline
## Intro

## Intro
### Motivation

- Academic websites matter:
	- Showcase your work, publications, projects
	- It's *yours* — you can take it with you (unlike institutional pages)
- Many tools exist for static websites — today we use **Quarto**
	- Simple, works in RStudio / Positron / VS Code
	- Easy to publish
	- Good documentation
- I use Quarto for several websites (e.g. this lecture series). 
- Today I'll also rebuild my own academic site alongside you — so this workshop is for both of us 🙂

### What a finished site looks like

- Show 1–2 polished examples (open in browser):
	- [Silvia Canelón](https://silviacanelon.com/)
	- [Andrew Heiss](https://www.andrewheiss.com/)
- "By the end of today, you'll have your own version of this — live, online, with your name on it."

### Plan for today

1. Quarto basics
2. **Build a basic website from scratch** — Goal: understand how Quarto websites work under the hood.
3. **Switch to a template** I prepared with some more content. Together we'll go through the components and you customize them for yourself.
4. **Publish your website online** — via GitHub Pages.
5. **Wrap up** — where to go next.

- Questions anytime.
- You can follow along if you have a new version of RStudio/Positron installed

### What is Quarto?

- Scientific publishing system for many output types:
	- Websites, reports, books, slides, papers, …
	- Today we focus on **websites**
- Basic idea — a Quarto document (`.qmd`) has three components:
	- Markdown text
	- (Optional) code chunks
	- YAML header for metadata
		- "YAML is a config file format — key-value pairs, indentation matters. Your IDE will help with the formatting."
- You **render** the project → Quarto turns `.qmd` files into HTML the browser can display
- A *website* is just: many `.qmd` files + one `_quarto.yml` config file

> 💡 What we **won't** cover today: executing code in documents, PDFs/papers, slides, advanced theming/CSS, custom domains. All possible with Quarto — pointers at the end.

## Build a website from scratch (15 min)

### Framing (1 min)

- Before we use the template, I want to show you how Quarto builds a website from the ground up. Once you've seen this, the template will make a lot more sense.
- **No need to follow along** — just watch. (You can if you want, but you don't need to.)
- We'll build a tiny website together, then move to the template.
### Create the project (3 min)

```
File → New Project → New Directory → Quarto Website
```

- Name it something throwaway (`scratch-site` or similar)
- Click *Create*
- Show what Quarto generated:
	- `_quarto.yml` — the config file for the whole site
	- `index.qmd` — the home page
	- `about.qmd` — second page
	- `styles.css` — for custom styling

### Render it (2 min)

- Click the **Render** button
- RStudio preview pane shows the site
	- Navbar at the top with "Home" and "About"
	- Click between pages — it's a real website
- "That's it. Two `.qmd` files plus one config file = a working website."

> 💬 *Mention briefly:* there's also a `quarto render` / `quarto preview` command if you prefer the terminal — but the button does the same thing, and we'll stick with the button today.
### How it fits together (4 min)

- Open `index.qmd`:
	- YAML header at the top (title)
	- Markdown content below
	- "This is what every page in your site looks like — header + content."
- Open `_quarto.yml`:
	- "This is the project-level config. It controls things that apply to the whole site."
	- Point out (don't deep-dive): `project: type: website`, `website: title:`, `navbar:`, `format: html: theme:`
	- "We'll go through this file in detail in a minute when we open the template — for now, just notice that the navbar entries here are what you saw at the top of the site."

### Add a new page (4 min)

- Create a new file: `cv.qmd`
	- Add a YAML header with just `title: "CV"`
	- Add some dummy markdown text ("# Education" + a line)
- Wire it into the navbar in `_quarto.yml`:
```yaml
	navbar:
	  left:
	    - href: index.qmd
	      text: Home
	    - href: about.qmd
	      text: About
	    - href: cv.qmd
	      text: CV
```
- Render again → CV now appears in the navbar
- "That's the core loop: write a `.qmd`, add it to `_quarto.yml`, render."

### Other editors (30 sec)

- "If you're in Positron, the same buttons are in the same place. VS Code works too with the Quarto extension. Everything we do today translates directly."

### Catch-up pause (30 sec)

- "We're about to switch to the template. Quick pause — any questions on what we just did?

> 🎯 **What they should take away from this block:**
> A Quarto website = a folder of `.qmd` files + `_quarto.yml`. Add a page = create a `.qmd` + add it to the navbar. Render = button. That's the whole mental model.

---

## Switch to the template (10 min)

### Framing (1 min)

- "Now you've seen how a Quarto website works under the hood. We *could* build everything else from scratch — CV page, publications, blog — but we'd run out of time."
- "So I prepared a small template with all of these already set up. We'll spend the rest of the workshop customizing it into *your* website."
- "The template is just what we built, with more pages and some nicer defaults."


- From now on: You can follow along with me
	- There will be some pauses in between where you can work on the project your self

### Download and open (5 min)

- Drop link in chat: **[GitHub repo URL]**
- Steps (also in chat as text):
	1. Click the green **Code** button → **Download ZIP**
	2. Unzip somewhere you can find it
	3. Double-click the `.Rproj` file → opens in RStudio
		- *(Positron users: open the folder)*
- Click **Render** → see the template site in the preview pane
- "Take a moment to click around the navbar and see what's there."
### Quick tour of the file structure (2 min)

- Open the Files pane in RStudio
- Point out:
	- `_quarto.yml` — same config file as before, just bigger
	- `index.qmd` — home page (set up as an *About* page — we'll see what that means)
	- `cv.qmd` — CV
	- `publications.qmd` — publications
	- `blog.qmd` + `posts/` folder — blog listing + the actual posts
	- `styles.css` — small custom tweaks
	- `_site/` — *rendered output, ignore* (Quarto generates this)
- "We'll go through each of these now, one at a time."

---

## Template tour & customize (30 min)

### How this block works (30 sec)

- "For each page type, I'll show you what's in the file and what you can change. Then you'll have a few minutes to customize it for yourself before we move on."
- "Don't worry if you don't finish each section — you can keep editing after the workshop. The goal is that you understand each pattern."

---

### `_quarto.yml` — the config (5 min demo + 3 min exercise)

- Open `_quarto.yml`
- "YAML is a config file format — key-value pairs, indentation matters. Your IDE will help with the formatting."
- Walk through the main sections:
	- **`project:`** — `type: website` tells Quarto this is a website project
	- **`website:`** — site-wide settings:
		- `title:` — appears in the navbar
		- `navbar:` — links across the top (you've seen this)
		- `page-footer:` — text at the bottom of every page
		- "Many more options — sidebar, breadcrumbs, search, … see the [Quarto website docs](https://quarto.org/docs/websites/website-navigation.html)"
	- **`format:`** — formatting options applied to every page
		- `theme:` — controls the overall look. Show the [theme list](https://quarto.org/docs/output-formats/html-themes.html)
		- `css:` — custom CSS tweaks on top of the theme

> ✏️ **Exercise (3 min):**
> 1. Change the site `title:` to your name
> 2. Pick a theme from the [theme list](https://quarto.org/docs/output-formats/html-themes.html) and swap the `theme:` value
> 3. Render and see what changed

---

### `index.qmd` — the About page (4 min demo + 4 min exercise)

- Open `index.qmd`
- "This is the landing page. I set it up as an **About page** — a special Quarto page type for personal intros."
- Show the YAML:
	- `about:` block — this is what makes it an About page
	- `template:` — Quarto has [several about templates](https://quarto.org/docs/websites/website-about.html) (jolla, trestles, solana, marquee, broadside)
	- `image:` — path to your photo (must be in the project folder)
	- `links:` — social/email links, can be text or icons
- Show the markdown content below the YAML — short bio, written by hand

> ✏️ **Exercise (4 min):**
> 1. Replace the placeholder text with a short bio about yourself
> 2. Update the `links:` (email, GitHub, etc.) — delete what doesn't apply
> 3. (Optional) Try a different about `template:` and re-render to see the difference

---

### `cv.qmd` — a plain page (2 min demo + 3 min exercise)

- Open `cv.qmd`
- "This one's deliberately simple — just a YAML header with a title, and markdown content."
- "A page can be this simple. Headings, lists, links — whatever you'd write in a markdown document."
- Point out the structure: Education / Positions / Awards as `##` headings

> ✏️ **Exercise (3 min):**
> 1. Replace the placeholder content with your own CV (or just a few lines — you can finish later)
---
### `publications.qmd` — also a plain page (2 min demo)

- Open `publications.qmd`
- "Same idea — markdown content. I've grouped publications by year using `##` headings."
- "For each entry: just write the citation by hand, optionally with a link to the journal or PDF."
- "If you have a lot of publications, you can later switch to a `.bib` file — Quarto can render those automatically. Pointer in the docs. For today, hand-written is the easiest start."

> 💡 *No exercise here — they'll customize this on their own time. Move on to the blog.*

---

### `blog.qmd` + `posts/` — listing pages (4 min demo + 5 min exercise)

- "Apart from regular pages and About pages, Quarto has a third type: **listing pages**. A listing is just a page that shows a list of *other* pages."
- "Perfect for a blog, but also for talks, projects, publications — anything that's a collection."
- Open `blog.qmd`:
	- YAML has a `listing:` block
	- `contents: posts` → "look in the `posts/` folder for items"
	- `type: default` → controls how the list looks (`default`, `grid`, `table`)
	- `sort: "date desc"` → newest first
	- `categories: true` → show category sidebar
- Open the `posts/` folder:
	- "Convention: one subfolder per post, each with an `index.qmd` inside"
	- Open **post 1**: simple — just a title, date, and some text
	- Open **post 2**: a bit fancier — image, categories, more formatting
- "Any markdown text *above* the listing block in `blog.qmd` would appear above the list. You can introduce your blog there."

> ✏️ **Exercise (5 min):**
> 1. Add a new post: create a folder in `posts/`, add an `index.qmd` with a title, date, and a few lines of text
> 2. Render and check that it appears in the blog listing
> 3. Try changing `type: default` to `type: grid` in `blog.qmd` and re-render to see the difference

---

### *(Optional)* Customizing colors and fonts with SCSS (3 min demo, no exercise)

- "Themes give you a starting point — but you'll often want to tweak colors, fonts, or spacing to make the site feel like *yours*. Quarto supports this through SCSS."
- "I won't go deep — just want you to know where this lives so you can play with it after the workshop."

- Open the `.scss` file in the project (e.g. `custom.scss`)
- Show the structure:
	- **`/*-- scss:defaults --*/`** — variables that override the theme's defaults (primary color, fonts, link color, …)
	- **`/*-- scss:rules --*/`** — custom CSS rules layered on top
- Point out 1–2 concrete examples in your file:
	- e.g. `$primary: #2c5f8d;` → controls the navbar and link color
- Show how it's wired in `_quarto.yml`:

```yaml
	format:
	  html:
	    theme: [cosmo, custom.scss]
```
- "The theme name plus your SCSS file in a list — Quarto applies them in order, your overrides win."
- Render → show the before/after (if you have a quick way to toggle, otherwise just show the styled version)

> 💡 **If you want to go further:**
> - Full list of variables you can override: [Quarto theming docs](https://quarto.org/docs/output-formats/html-themes.html#theme-options)
> - Bootstrap (which Quarto themes are built on) has [hundreds of variables](https://quarto.org/docs/output-formats/html-themes.html#sass-variables) you can tweak
> - Pick colors with [coolors.co](https://coolors.co) or [Adobe Color](https://color.adobe.com)

### Wrap the customize block (1 min)

- "You now know every page type Quarto uses for a personal website: regular pages, About pages, and listing pages. Everything else is variations on these three."
- "Next: getting your site online."

## Publishing your website (20 min)

### How publishing works in general (3 min)

- **What you have right now:**
	- When you render, Quarto produces a folder of HTML, CSS, and image files
	- Open `_site/` in the Files pane briefly: "This is your website. These files are everything a browser needs to display it."
	- "Right now they live on your laptop — only you can see them."

- **What you need to publish:**
	- A **hosting service** — somewhere on the internet that will store these files and serve them at a URL anyone can visit.
	- That's the entire concept. Render → upload to a host → site is live at a URL.

- **Different ways to do this with Quarto:**
	- **GitHub Pages** — free, hosts one site per GitHub repo. Today's choice.
	- **Netlify** — free tier, very flexible, supports custom domains easily
	- **Posit Connect Cloud** — Posit's newer offering, replacing Quarto Pub
	- **Your university web server** — if your institution provides one, you can usually just upload the rendered files via FTP - FU also offers this, it's called a userpage https://userpage.fu-berlin.de/
	- Full list and instructions in the [Quarto publishing docs](https://quarto.org/docs/publishing/)
>
💡 *All of these hosts do the same fundamental thing — take your rendered files and put them on the web. The differences are in convenience, features, and cost. Once you understand the concept, switching hosts later is straightforward.*

### Today: Github pages

- **Why GitHub Pages today:**
	- Free, reliable, professional URL (`username.github.io/sitename`)
	- Version control built in — every change is tracked
	- Standard in the academic community
	- Skills transfer (Git is worth knowing anyway)
### Heads-up about the email (1 min)

- "Quick note: in the email I mentioned two publishing options — GitHub Pages and Quarto Pub."
- "Since then, Quarto Pub got deprecated. The replacement (Posit Connect Cloud) isn't quite ready for a smooth live workshop — I tried it and hit some friction."
- "So today we'll all do **GitHub Pages**. It's the most reliable option, gives you a nicer URL, and is the standard for academic personal sites."
- "If you don't have Git set up yet, **follow along conceptually**. I'll share a written how-to with screenshots — you can finish at your own pace after the workshop. No pressure to get it live in the next 20 min."
### Basic idea of GitHub (1 min)

- "GitHub stores an online copy of your project. Among other things, it can host one free website per repository."
- "You connect your local project to a GitHub repo, push your files there, and turn on Pages in the settings. That's it."
- "Learning Git in depth is out of scope today — but the steps we'll do are click-by-click."

### Step 1 — Tell Quarto to render to `docs/` (2 min)

- "GitHub Pages serves files from a folder called `docs/` by default. Quarto renders to `_site/`. So we tell Quarto to use `docs/` instead."
- Open `_quarto.yml` and add under `project:`:
```yaml
	project:
	  type: website
	  output-dir: docs
```
- Render → notice `docs/` folder appears, `_site/` is no longer used
	- *(Tip: delete the old `_site/` folder to avoid confusion)*
### Step 2 — Make it a Git repository and push to GitHub (8 min)

- Live demo: Use Github Desktop to push to Github
	- If you use other methods: that's fine too.
	- I show Github Desktop because this would be the easiest way for people who have no experience with Git and Github -> This is also what is used in the guide
### Step 3 — Turn on GitHub Pages (2 min)

- On your GitHub repo page:
	1. **Settings** (top tab) → **Pages** (left sidebar)
	2. Source: **Deploy from a branch**
	3. Branch: **main**, folder: **/docs**
	4. Click **Save**
- "GitHub now builds your site. Takes about 1–2 min the first time."
- The URL appears at the top of the Pages settings: `https://<username>.github.io/<reponame>/`
- Refresh the URL after a minute → site is live 🎉

### Practice: Now you - publish your website on Github

### Share your URL 🎉 (2 min)

- "If your site is live, drop the URL in chat — let's see everyone's sites!"
- React to a few. Quick celebration. This is the emotional payoff.
- "If you're not there yet, that's okay — the guide will get you there this week."
### Updating your site later (1 min)

- "Once it's set up, the workflow is:
	1. Edit your `.qmd` files
	2. Render
	3. In the Git pane: stage, commit, push
	4. GitHub rebuilds automatically — your changes are live in ~1 min"
- "That's it. Welcome to having a website."
### Other publishing options (30 sec — only if asked)

- "Quarto supports other publishers too — Posit Connect Cloud, Netlify, and others. All documented [here](https://quarto.org/docs/publishing/). For an academic site, GitHub Pages is hard to beat."

> 🎯 **What they should take away:**
> Render to `docs/`, push to GitHub, turn on Pages. To update later: edit, render, push.

## Wrap up & where to go next (10 min)

### What you've built today (1 min)

- "Quick recap of what you can now do:
	- Build a Quarto website from scratch
	- Customize the main page types — about pages, plain pages, listing pages
	- Configure the site through `_quarto.yml` (themes, navbar, footer)
	- Publish it to GitHub Pages and update it whenever you want"
- "That's the whole core skill set. Everything else is variations and extras."

### Inspiration: other academic Quarto sites (3 min)

- "The best way to keep learning is to look at how other people built their sites — and many of them share their code on GitHub."
- "I've linked the full list on the lecture website. Quick tour of a few:"

	| Site | What's interesting |
	|---|---|
	| [Silvia Canelón](https://silviacanelon.com/) | Beautiful design, custom styling, great use of about pages |
	| [Andrew Heiss](https://www.andrewheiss.com/) | Rich academic content — teaching, research, blog |
	| [Sam Csik](https://samanthacsik.github.io/) | Clean structure, well-organized projects page |
	| [John Helveston](https://www.jhelvy.com/) | Good example of a publications page |

- "**The trick**: when you see something you like on someone's site, find their GitHub repo and look at how they did it. Use the pattern in your own site."
- "Overview with more examples: [Gang He's curated list](https://drganghe.github.io/quarto-academic-site-examples.html)"

### Things you might want to do next (2 min)

- **Custom domain** — if you have one (`yourname.com`), you can point it at your GitHub Pages site. Easy via Netlify, also possible directly with GitHub.
- **Fancier publications page** — switch from hand-written to a `.bib` file with automatic formatting. [Docs here](https://quarto.org/docs/authoring/citations.html).
- **Custom styling** — go deeper into SCSS to really make the site yours.
- **Add Google Analytics or Plausible** — see who visits your site. [Docs](https://quarto.org/docs/websites/website-tools.html#google-analytics).
- **Write your first real blog post** — research note, conference takeaways, tutorial. Easiest way to start sharing your work.

# Questions/Comments
- How does it look like in VS code?
- Publication list as listings with buttons etc.
- What about bluesky?
- blog: How to add text above/below etc.

## Publish with Posit connect

- https://connect.posit.cloud/ make account

```r
install.packages("rsconnect")
rsconnect::connectCloudUser() 
```
