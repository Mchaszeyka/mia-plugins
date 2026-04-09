# Mia Plugins — Claude Cowork & Claude Code Plugin Suite

A collection of 10 production-grade Claude Cowork plugins for marketing, sales, and product operations professionals. Built by [Mia Chaszeyka](https://miachaszeyka.com).

> These plugins were built from real work: managing 4.7M contacts across 54 HubSpot projects, auditing attribution stacks that captured 8% of actual revenue, building 125+ nurture sequences across 5 personas, and enforcing GDPR across an entire contact database. Every skill reflects a workflow that was previously done manually.

---

## Plugins

| Plugin | For | Complexity | Install |
|---|---|---|---|
| [gtm-brief-generator](./gtm-brief-generator) | PMM, Product, Sales | Low | `/plugin install github:miachaszeyka/mia-plugins/gtm-brief-generator` |
| [email-performance-debrief](./email-performance-debrief) | Marketing Ops, Demand Gen | Low | `/plugin install github:miachaszeyka/mia-plugins/email-performance-debrief` |
| [win-loss-synthesizer](./win-loss-synthesizer) | Product, Sales, PMM | Low | `/plugin install github:miachaszeyka/mia-plugins/win-loss-synthesizer` |
| [persona-content-matrix](./persona-content-matrix) | PMM, Content, Demand Gen | Low | `/plugin install github:miachaszeyka/mia-plugins/persona-content-matrix` |
| [launch-readiness-agent](./launch-readiness-agent) | Product, PMM, Marketing | Medium | `/plugin install github:miachaszeyka/mia-plugins/launch-readiness-agent` |
| [nurture-sequence-architect](./nurture-sequence-architect) | Marketing Ops, Demand Gen | Medium | `/plugin install github:miachaszeyka/mia-plugins/nurture-sequence-architect` |
| [campaign-attribution-auditor](./campaign-attribution-auditor) | Marketing Ops, Analytics | Medium | `/plugin install github:miachaszeyka/mia-plugins/campaign-attribution-auditor` |
| [crm-data-quality-enforcer](./crm-data-quality-enforcer) | Marketing Ops, RevOps | Medium | `/plugin install github:miachaszeyka/mia-plugins/crm-data-quality-enforcer` |
| [segment-health-monitor](./segment-health-monitor) | Marketing Ops | High | `/plugin install github:miachaszeyka/mia-plugins/segment-health-monitor` |
| [icp-signal-scanner](./icp-signal-scanner) | Sales, Marketing, Product | High | `/plugin install github:miachaszeyka/mia-plugins/icp-signal-scanner` |

---

## Quick Start

### Install a single plugin
```bash
# In Claude Code terminal
/plugin install github:miachaszeyka/mia-plugins/gtm-brief-generator
```

### Clone and load locally for development
```bash
git clone https://github.com/miachaszeyka/mia-plugins
cd mia-plugins

# Load one plugin
claude --plugin-dir ./gtm-brief-generator

# Load all plugins
claude \
  --plugin-dir ./gtm-brief-generator \
  --plugin-dir ./email-performance-debrief \
  --plugin-dir ./win-loss-synthesizer \
  --plugin-dir ./persona-content-matrix \
  --plugin-dir ./launch-readiness-agent \
  --plugin-dir ./nurture-sequence-architect \
  --plugin-dir ./campaign-attribution-auditor \
  --plugin-dir ./crm-data-quality-enforcer \
  --plugin-dir ./segment-health-monitor \
  --plugin-dir ./icp-signal-scanner
```

---

## Plugin Design Principles

Every plugin in this suite follows the same rules:

1. **Output is an artifact, not a conversation.** Every plugin produces a structured document someone can act on, share, or file.
2. **No invented data.** Skills are explicit about the difference between facts (from data provided) and inferences (from pattern matching). Nothing is fabricated.
3. **Operational spec, not just content.** Marketing plugins don't just write copy — they produce enrollment criteria, suppression logic, send cadence, and success metrics.
4. **Benchmarks built in.** Email benchmarks, attribution coverage thresholds, segment health criteria — these are embedded in the skills, not left to the user to look up.
5. **Ask before guessing.** If critical input is missing, plugins ask the one most important clarifying question rather than proceeding on assumptions.

---

## Command Reference

| Command | Plugin | What It Does |
|---|---|---|
| `/gtm-brief-generator:brief` | GTM Brief Generator | Generate full GTM brief from feature spec |
| `/email-performance-debrief:analyze` | Email Performance Debrief | Diagnose email campaign underperformance |
| `/win-loss-synthesizer:analyze` | Win/Loss Synthesizer | Synthesize interviews into competitive brief |
| `/persona-content-matrix:map` | Persona Content Matrix | Map content gaps against personas |
| `/launch-readiness-agent:plan` | Launch Readiness Agent | Generate launch checklist with owners |
| `/launch-readiness-agent:status` | Launch Readiness Agent | Check launch status, surface blockers |
| `/nurture-sequence-architect:build` | Nurture Sequence Architect | Build full nurture playbook |
| `/nurture-sequence-architect:extend` | Nurture Sequence Architect | Add emails to existing sequence |
| `/campaign-attribution-auditor:audit` | Campaign Attribution Auditor | Full attribution gap audit |
| `/campaign-attribution-auditor:utm` | Campaign Attribution Auditor | Quick UTM hygiene check |
| `/crm-data-quality-enforcer:audit` | CRM Data Quality Enforcer | Full CRM data quality audit |
| `/crm-data-quality-enforcer:consent` | CRM Data Quality Enforcer | GDPR/consent compliance check |
| `/segment-health-monitor:check` | Segment Health Monitor | Pre-send segment clearance |
| `/segment-health-monitor:overlap` | Segment Health Monitor | Overlap analysis across sends |
| `/icp-signal-scanner:scan` | ICP Signal Scanner | Scan account list for intent signals |
| `/icp-signal-scanner:deep` | ICP Signal Scanner | Deep scan for single account |

---

## Submitting to the Anthropic Plugin Directory

To submit any of these plugins to the official Anthropic marketplace:
- [claude.ai/settings/plugins/submit](https://claude.ai/settings/plugins/submit)
- [platform.claude.com/plugins/submit](https://platform.claude.com/plugins/submit)

---

## About

Built by **Mia Chaszeyka** — Marketing Operations professional transitioning into AI Product Management.

- Website: [miachaszeyka.com](https://miachaszeyka.com)
- LinkedIn: [linkedin.com/in/miachaszeyka](https://linkedin.com/in/miachaszeyka)
- GitHub: [github.com/miachaszeyka](https://github.com/miachaszeyka)

---

## License

MIT — free to use, modify, and distribute. Attribution appreciated.
