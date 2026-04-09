# Launch Readiness Agent — Claude Cowork Plugin

Generates a role-specific launch readiness checklist from a launch brief. Not a generic template — a launch-specific plan with real owners, real deadlines, and explicit gap flagging.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM

---

## What It Does

Describe your launch. Get back:

- Readiness checklist by function (Product, PMM, Marketing, Sales, Support, Events, Legal)
- Critical path items — the blockers that cascade
- Missing assets called out explicitly (no softening)
- T-minus timeline week by week
- Launch day runbook

Works for product launches, feature releases, events, and campaigns.

If Google Drive or Slack is connected, the agent checks for existing assets before flagging gaps.

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/launch-readiness-agent
```

---

## Commands

```
/launch-readiness-agent:plan   — Generate full readiness plan from launch brief
/launch-readiness-agent:status — Check current status, surface blockers
```

---

## Example Input

```
/launch-readiness-agent:plan Launch: HubSpot + Segment Real-Time Sync | Date: May 15 | Type: Feature | Teams: Product, PMM, Marketing Ops, Sales, Support
```

---

## License

MIT
