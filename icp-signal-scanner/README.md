# ICP Signal Scanner — Claude Cowork Plugin

Scans target accounts for buying intent signals and scores them by purchase readiness. Tells you which accounts to prioritize for outreach today — and why — based on real-world signals, not just firmographic fit.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM

---

## What It Does

Provide a target account list and ICP definition. Get back:

- Accounts scored by signal strength (0–10)
- Priority outreach list ranked by score
- Signal cards for high-priority accounts (signal type, date, source, recommended outreach angle)
- Accounts with no signal flagged for deprioritization
- Pattern observations across the full list
- Recommended follow-up actions by owner

When web search is available, the signal-researcher agent actively looks up signals per account. When not available, outputs the scoring framework and manual lookup instructions.

**Never fabricates signals.** If no signal is found, it says so.

---

## Signal Types Scored

| Signal | Weight |
|---|---|
| Series B+ funding | High (3pts) |
| Executive hire (VP/C-suite in relevant function) | High (3pts) |
| Series A funding | High (3pts) |
| Relevant job postings | Medium (2pts) |
| Tech stack change | Medium (2pts) |
| Product launch | Medium (2pts) |
| Acquisition | Medium (2pts) |
| Compliance event | Medium (2pts) |
| Relevant news coverage | Low (1pt) |
| Conference sponsorship | Low (1pt) |

**Priority thresholds:** 6+ pts = prioritize now · 3–5 pts = next cycle · 1–2 pts = monitor · 0 pts = deprioritize

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/icp-signal-scanner
```

---

## Commands

```
/icp-signal-scanner:scan  — Scan a full account list
/icp-signal-scanner:deep  — Deep scan for a single account
```

---

## License

MIT
