---
mode: agent
description: "Get a critical second opinion from another AI model on a proposal (via ai-peer-review/consult-ai.mjs), then synthesize it."
---

Get a **critical** second opinion from another AI model (GPT, Claude, or Gemini) on the current
proposal — an idea, draft, outline, design, or piece of writing — then synthesize it into a
recommendation. The other model is a critic, not a co-author; you decide what it should be critical about.

Steps:
1. **Pick the model.** Default to a family *other* than yourself, or the one the user names. Recommended
   ids: `gpt-5.4` (OpenAI), `claude-sonnet-4-6` (Anthropic), `gemini-3.5-flash` (Gemini). As Copilot/GPT
   you'd typically consult `claude-sonnet-4-6` or `gemini-3.5-flash`.
2. **Assemble a short brief** of the concrete proposal.
3. **Compose a critic rubric tuned to the topic.** Write the rubric and the brief to two temp files **in
   the OS temp directory** (`%TEMP%` on Windows, `/tmp` on macOS/Linux) — not in the repo, so nothing
   sensitive is left behind — then run the helper passing both as files, and **delete them afterward**.
   **Use `--file` — it works in Windows/PowerShell, where bash heredocs (`<<'EOF'`) fail:**
   ```
   node ai-peer-review/consult-ai.mjs --model claude-sonnet-4-6 --system-file <temp>/pr-rubric.txt --file <temp>/pr-proposal.txt
   ```
   (To keep them in-repo instead, use `.peer-review/tmp/`, which the installer gitignores.)
   - No `--system` → the CLI uses the project's `.peer-review/rubric.md` if present, else a generic
     critical stance. Options: `--max-tokens <n>` (default 8192; raise for reasoning models).
4. **If you cannot run a terminal command**, print the exact command for the user and use the pasted output.
5. **Synthesize, don't parrot:** report the strongest objection + suggested improvement, say whether you
   agree and why, then give your revised recommendation.

Constraints:
- **Auto-raise on truncation** — if the CLI exits with `empty response from model` or the critique is
  cut off mid-sentence, re-run **once** with a higher `--max-tokens` (e.g. double it, ~16000) before
  reporting; only tell the user about a token issue if it still fails.
- **One round by default** — no automatic multi-round debate; only another pass if the user asks.
- **Multiple models when asked** — if the user names more than one, run the helper once per model and
  synthesize across them (where they agree/disagree). Independent one-shot critiques, not a debate.
- If the helper reports a key is not set, tell the user to set the matching env var (`OPENAI_API_KEY` /
  `ANTHROPIC_API_KEY` / `GEMINI_API_KEY`) or add it to a `.env` at the project root — don't retry blindly.
