# Campaign Attribution Auditor — Claude Cowork Plugin

Audits your campaign attribution stack for gaps, broken tracking, and quantified revenue loss. Goes beyond showing you the numbers — tells you exactly what's broken, how much pipeline it's costing you, and what to fix first.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM  
*Built from real-world experience: audited a KubeCon EU attribution stack where GA4 was capturing 8% of actual revenue — consent rejection accounted for 85.5% of paid website-path registrants lost to tracking gaps.*

---

## What It Does

Provide UTM data, a GA4 export, CRM campaign records, or a description of your tracking setup. Get back:

- Attribution coverage score (GA4 ÷ CRM revenue) with health benchmark
- Issues ranked by estimated revenue impact — with calculation shown
- UTM hygiene report (naming inconsistencies, missing fields, broken links)
- Consent/GDPR signal loss analysis with estimated dollar impact
- CDN/static site architecture gap detection
- Prioritized fix roadmap by week
- Monitoring recommendations to catch drift early

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/campaign-attribution-auditor
```

---

## Commands

```
/campaign-attribution-auditor:audit  — Full attribution gap audit
/campaign-attribution-auditor:utm    — Quick UTM hygiene check only
```

---

## Gap Types Covered

| Gap Type | Revenue Impact |
|---|---|
| Broken / missing UTMs | Medium |
| Consent/cookie rejection (GDPR/CCPA) | High |
| CDN/static site JS blocking | High |
| CRM-to-GA4 reconciliation gap | Medium-High |
| Form tracking / lead source loss | High |
| Cross-domain attribution loss | Medium |
| Dark traffic / referral stripping | Low-Medium |
| Offline conversion import gap | Medium |

---

## Benchmark

Healthy B2B attribution coverage = **65–85%** (GA4-attributed revenue ÷ CRM total revenue).  
Below 50% indicates a structural tracking problem requiring engineering involvement.

---

## License

MIT
