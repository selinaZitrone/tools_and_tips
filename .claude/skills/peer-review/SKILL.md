---
name: peer-review
description: Use when the user wants a critical second opinion from another AI model (GPT, Claude, or Gemini) on an idea, draft, design, outline, or piece of writing — e.g. "get GPT's peer review", "what would Gemini object to", "stress-test this". Runs ai-peer-review/consult-ai.mjs to fetch a sharp critique, then synthesizes it. Not for every message — only a concrete proposal worth reviewing.
---

# Peer review — consult another AI as a critic, then synthesize

Get a critical second opinion from another model via `ai-peer-review/consult-ai.mjs`, weigh it, and fold
it into your own recommendation. The other model is a **critic, not a co-author** — and **you** decide
*what* it should be critical about by composing the rubric for the specific topic.

## When to use
- The user explicitly asks for a second opinion / stress-test of a concrete proposal.
- **Not** on every message — only when there's a specific idea or draft worth reviewing.

## How to run it
1. **Pick the model.** Default to a model family *other* than yourself, or the one the user names.
   Recommended current ids: `gpt-5.4` (OpenAI), `claude-sonnet-4-6` (Anthropic), `gemini-3.5-flash`
   (Gemini). As Claude, you'd typically consult `gpt-5.4` or `gemini-3.5-flash`.
2. **Assemble a short brief** of the concrete proposal (the idea / the draft + what it's for).
3. **Compose a critic rubric tuned to the topic** — pointed questions that fit *this* domain (a lesson
   plan, a seminar outline, an argument, a piece of copy, a design decision, code, …). Write the rubric
   and the brief to two temp files **in the OS temp directory** (`/tmp` on macOS/Linux, `%TEMP%` on
   Windows) — not in the repo, so nothing potentially sensitive is left behind — pass both as files, and
   **delete them afterward**. Files (`--file`/`--system-file`) are portable across PowerShell and bash:

   ```
   node ai-peer-review/consult-ai.mjs --model gpt-5.4 --system-file <temp>/pr-rubric.txt --file <temp>/pr-proposal.txt
   ```

   (If you'd rather keep them in-repo, use `.peer-review/tmp/`, which the installer gitignores.)

   - If you pass no `--system`, the CLI uses the project's `.peer-review/rubric.md` if present, else a
     generic critical stance. Composing a tuned rubric per call is still best.
   - Options: `--max-tokens <n>` (default 8192 — a ceiling, not a cost; raise it for reasoning models).
     Critique prints to stdout; `model=… provider=… rubric=… tokens=…` to stderr.

## After you get the critique
- **Synthesize, don't parrot.** Report the other model's strongest objection + its suggested
  improvement, say whether you agree and why, then give your revised recommendation.
- **Auto-raise on truncation — don't make the user do it.** If the CLI exits with `empty response from
  model` or the critique is visibly cut off mid-sentence, re-run **once** with a higher `--max-tokens`
  (e.g. double it, ~16000) before reporting. Only surface a token issue to the user if it still fails.
- **One round by default** — don't loop into an automatic back-and-forth debate; only a second pass if
  the user asks.
- **Multiple models when asked** — if the user names more than one ("ask both GPT and Gemini"), run the
  helper once per model and synthesize across them (where they agree/disagree). Independent one-shot
  critiques, not a debate.

## If the key is missing
The CLI exits non-zero with `OPENAI_API_KEY` / `ANTHROPIC_API_KEY` / `GEMINI_API_KEY not set`. Don't
retry — tell the user to set that env var or add it to a `.env` at the project root (see `.env.example`
and the toolkit README), then re-run.
