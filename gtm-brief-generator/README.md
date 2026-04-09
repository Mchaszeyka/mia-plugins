# GTM Brief Generator — Claude Cowork Plugin

Generates complete, stakeholder-ready go-to-market briefs from a feature spec or release note.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM

---

## What It Does

Paste in a feature spec, release note, or product description. Get back a full GTM brief with:

- One-line positioning statement
- Target segment (primary, secondary, excluded)
- Problem statement from the buyer's perspective
- Key messages by persona (up to 3)
- Sales talking points (verbatim-ready)
- Objection handlers
- Recommended channel mix with priority
- Launch assets checklist
- Success metrics with targets

No more blank-page briefs. No more misaligned launches.

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/gtm-brief-generator
```

Or clone and load locally:

```bash
git clone https://github.com/miachaszeyka/mia-plugins
claude --plugin-dir ./mia-plugins/gtm-brief-generator
```

---

## Usage

### Slash command (quickest)
```
/gtm-brief-generator:brief [paste your feature spec or release note]
```

### Natural language (in Cowork)
Just describe what you're launching and ask Claude to generate a GTM brief. The skill activates automatically.

---

## Example Input

```
We're launching a new HubSpot integration that syncs real-time product usage data 
from Segment into contact records. It updates lifecycle stage automatically based 
on usage thresholds. Target: B2B SaaS companies using HubSpot + Segment, 50-500 employees.
```

## Example Output Sections

**Positioning:** "For B2B SaaS revenue teams, our Segment-HubSpot sync is the usage intelligence layer that automatically advances contacts through lifecycle stages — unlike manual CSV imports or Zapier workarounds, which lose real-time signal and require constant maintenance."

**Primary Buyer:** VP Marketing / Marketing Ops Manager at B2B SaaS, 50–500 employees, already using HubSpot + Segment.

*(Full 9-section brief generated automatically)*

---

## Part of the Mia Plugins Suite

This plugin is part of a collection of marketing, sales, and product operations plugins:

| Plugin | Purpose |
|---|---|
| `gtm-brief-generator` | GTM briefs from feature specs |
| `email-performance-debrief` | Diagnose email underperformance |
| `win-loss-synthesizer` | Competitive intel from interviews |
| `persona-content-matrix` | Content gap analysis |
| `launch-readiness-agent` | Launch checklist with owner tracking |
| `campaign-attribution-auditor` | UTM/attribution QA |
| `nurture-sequence-architect` | Full nurture playbook builder |
| `crm-data-quality-enforcer` | CRM hygiene audit |
| `segment-health-monitor` | Audience segment health QA |
| `icp-signal-scanner` | Buying intent signal detection |

---

## License

MIT — free to use, modify, and distribute.
