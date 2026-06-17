---
name: workshop-invite-email
description: Write the invitation email for the "Tools and Tips" lecture series, sent to the organizer who forwards it to all students. Use when Selina provides a workshop description and Webex meeting details and wants the formatted email. Produces a German greeting wrapper around an English content block.
---

# Workshop invitation email

Assemble the invitation email Selina sends to the organizer who forwards each
session announcement to the students. The email is always the same shape: a short
**German** greeting and sign-off wrapped around an **English** content block with
the workshop details and the Webex information.

## Inputs

The user will paste some or all of:

- **Workshop description** — usually a title, a description paragraph, a format
  line, and a preparations/requirements section (often the session page text).
- **Webex details** — date and time, meeting link, meeting number, password, and
  the video/phone/audio join blocks.
- **Recipient name** — the person the email is addressed to.

If the **recipient name** is missing, ask for it once (do not guess). If the
**date/time** is missing, ask for it. Everything else: use what is provided and
leave out any block the user did not give you — never invent meeting numbers,
links, or passwords.

## Output format

Produce the email as **plain text, ready to copy-paste** (no markdown, no code
fence around the whole thing in the final answer unless asked). Use this exact
structure:

```
Liebe <Name>,

hier das Thema für die nächste Veranstaltung in der Lecture series.

Liebe Grüße,

Selina

-------------------------------------------------------------

Title: <title>

Description: <description paragraph>

Format: <format line>

Preparations:

<preparations / requirements, as given — keep any sub-bullets and the
"Using a different editor?" note if present>

When? <date>, <time>

Where? Online on Webex

Meeting link:
<link>

Meeting number:
<number>

Meeting password:
<password>

Join from a video system or application
Dial <video dial address>
You can also dial <ip> and enter your meeting number.

Meeting password for video system
<video password>

Join by phone
<phone numbers, one per line>
Access code: <access code>

Global call-in numbers
<global call-in link>

Meeting password for audio
<audio password>
```

## Rules

- **The German wrapper text is fixed.** Only the recipient name changes. Keep
  "hier das Thema für die nächste Veranstaltung in der Lecture series." and the
  "Liebe Grüße, / Selina" sign-off exactly as written.
- **The content block is English**, matching the series language.
- **Copy all Webex numbers, links, passwords, and codes verbatim.** Never
  reformat, "correct", or shorten them — a wrong digit makes the meeting
  unjoinable. Preserve them character-for-character.
- **Tidy the prose lightly.** Fix obvious typos in the description/preparations
  (e.g. a doubled word) and normalise spacing, but do not rewrite Selina's
  wording or change the meaning.
- Keep the `-------------------------------------------------------------`
  separator line between the German wrapper and the English block.
- Omit any Webex sub-block that was not provided rather than leaving an empty
  label or a placeholder.
- After producing the email, briefly note anything you left out or any field you
  had to ask about.
