# Email Performance Debrief — Claude Cowork Plugin

Diagnose email campaign underperformance. Goes beyond showing you the numbers — tells you what's broken, why, and what to fix first.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM

---

## What It Does

Paste in your campaign metrics. Get back:

- Benchmark comparison (actuals vs. B2B industry benchmarks, by audience type)
- Root cause diagnosis by symptom pattern — not generic advice
- Prioritized optimization plan with Impact/Effort ratings
- Specific next send recommendation

Built on a benchmark dataset of 6,229 B2B campaigns / 472M sends. Covers: event, product, member, newsletter, and cold outreach audience types.

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/email-performance-debrief
```

Or clone and load locally:

```bash
git clone https://github.com/miachaszeyka/mia-plugins
claude --plugin-dir ./mia-plugins/email-performance-debrief
```

---

## Usage

### Slash command
```
/email-performance-debrief:analyze Campaign: KubeCon EU Pre-Show | Audience: Event registrants (8,400) | Open: 6.1% | CTR: 0.9% | Unsub: 0.61% | Conversions: 142
```

### Natural language (in Cowork)
Paste your campaign report and ask for a performance debrief. The skill activates automatically.

---

## Benchmark Reference (Built-In)

| Audience Type | Open Rate | CTR | Unsub Rate |
|---|---|---|---|
| Event: Major | 8.1% | 2.2% | 0.44% |
| Event: Standard | 7.1% | 0.8% | 0.39% |
| Member/Customer | 31.0% | 3.5% | 0.25% |
| Product/Community | 9.3% | 1.0% | 0.20% |
| General B2B | 15.1% | 2.1% | 0.26% |

You can override these with your own benchmarks in the prompt.

---

## License

MIT
