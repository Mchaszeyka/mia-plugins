---
name: test-all
description: Run the full plugin validation suite for all 10 mia-plugins. Use when you want to validate all plugins before a GitHub release.
disable-model-invocation: true
---

# Mia Plugins — Full Test Suite

Run validation for all 10 plugins in this repository. Follow the procedure in `TESTING.md` exactly. Write results to `test-results.md` when complete.

## Procedure

1. Read `TESTING.md` fully before starting
2. Run Structure Check for all 10 plugins (no Claude Code needed — file-based only)
3. Load each plugin one at a time using `claude --plugin-dir ./<plugin-name>`
4. Run the smoke test for each plugin
5. Run the output quality check for each plugin
6. Record results in `test-results.md`

## Pass criteria

A plugin is READY FOR RELEASE when:
- Structure Check: PASS
- Smoke Test: PASS
- Output Quality: PASS or WARN (not FAIL)

A plugin is BLOCKED when any check returns FAIL.

Start now. Do not ask for confirmation between plugins.
