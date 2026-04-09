# Segment Health Monitor — Claude Cowork Plugin

Audits audience segments before sends go out. Catches size drift, suppression failures, consent gaps, overlap violations, and CDP-CRM sync issues — the problems that cause bad sends, compliance risk, and duplicate emails.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM  
*Built from managing 90+ Segment.com audiences through a CDP migration, building bridge filter workarounds for 68 blocked audiences, and enforcing GDPR opt-in across 4.7M contacts.*

---

## What It Does

Provide segment names, sizes, and filter logic. Get back a pre-send clearance report:

- 🟢 GREEN — cleared to send
- 🟡 YELLOW — review required before send
- 🔴 RED — do not send, blocking issue found

Covers: size drift detection, suppression validation, consent coverage, overlap matrix, CDP-CRM sync status, and bridge filter health.

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/segment-health-monitor
```

---

## Commands

```
/segment-health-monitor:check    — Full pre-send health check
/segment-health-monitor:overlap  — Overlap analysis across simultaneous sends
```

---

## Failure Types Detected

| Issue | Risk |
|---|---|
| Size drift >20% without known cause | Over/under-sending |
| Zero-size segment | Missed send |
| Suppression list not applied | Compliance + brand |
| Overlap between mutually exclusive segments | Duplicate sends |
| EU contacts without legal basis | GDPR violation |
| CDP-CRM sync > 4 hours stale | Partial send |
| Multi-ID conflict | Double-send or missed contact |
| Bridge filter failure | Wrong subset enrolled |

---

## CDP Support

Primary: **Segment.com** (including bridge filter workaround patterns)  
Also supports: HubSpot lists, mParticle, RudderStack, generic CDP exports

---

## License

MIT
