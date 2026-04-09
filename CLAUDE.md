# Mia Plugins — Test Session

You are running a plugin validation session for the `mia-plugins` repository.

## Your job

Run the full test suite in `TESTING.md`. For each plugin:
1. Load it with `--plugin-dir`
2. Validate the structure
3. Run the smoke test
4. Run the output quality check
5. Record PASS / FAIL / WARN with specific notes

Do not skip any plugin. Do not summarize failures — describe exactly what broke and where.

When the full suite is complete, write results to `test-results.md` in this directory.

## Start command

Begin by running: `/mia-plugins:test-all`

If that command is not available, read `TESTING.md` and follow the manual test procedure.
