# Codex instructions

## Goal
Make this fork easy to run and maintain with Codex. Preserve the existing Follow Builders behavior unless the user explicitly asks to change product behavior.

## Setup
1. Work from the repository root.
2. Install script dependencies:
   ```bash
   cd scripts && npm install
   ```
3. No API keys are required for fetching the centrally hosted builders feed. Delivery integrations may require their own credentials; never commit secrets.

## Primary workflows
- Prepare an on-demand digest:
  ```bash
  cd scripts && npm run prepare-digest
  ```
- Generate/update the central feed only when intentionally working on feed generation:
  ```bash
  cd scripts && npm run generate-feed
  ```

## Validation
Before proposing changes:
1. Run `npm install` in `scripts/` if dependencies are missing.
2. Run `npm run prepare-digest` and verify it exits successfully and emits valid JSON.
3. If JavaScript files were changed, run `node --check <changed-file>` for each changed `.js` file where applicable.
4. Do not add API keys, tokens, chat IDs, email credentials, or `.env` contents to git.

## Product preferences for this fork
When asked to customize the digest, optimize for a technically sophisticated AI/product/data-science reader. Prioritize original builder insights, concrete technical/product implications, and signal over influencer commentary. Chinese or bilingual output may be requested, but do not change defaults unless asked.

## Important files
- `SKILL.md`: agent workflow and onboarding behavior.
- `scripts/prepare-digest.js`: deterministic digest input preparation.
- `scripts/generate-feed.js`: feed generation.
- `prompts/`: summarization/translation behavior.
- `config/default-sources.json`: curated sources.

## Working style
Use small, reviewable changes. Explain any behavior change in the PR description. Prefer a branch + PR over direct changes to `main`.