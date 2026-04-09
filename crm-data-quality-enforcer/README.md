# CRM Data Quality Enforcer — Claude Cowork Plugin

Audits CRM exports for data hygiene issues that silently break segmentation, scoring, reporting, and compliance. Outputs a scorecard and field-level remediation log — not a list of generic best practices.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM  
*Built from experience enforcing GDPR legal basis across 4.7M contacts, auditing 549 forms, fixing AOI taxonomy across 260 values, and identifying $35K in HubSpot seat waste.*

---

## What It Does

Provide a CRM export or describe your data. Get back:

- Data quality scorecard (0–100) across 8 dimensions
- Critical issues ranked by impact — breaking segmentation or compliance right now
- Field-level remediation log: every field with issues, bad value examples, exact fixes
- Duplicate record analysis with merge strategy
- GDPR/consent compliance status with violation risk flags
- Taxonomy/picklist violation table
- Phased 8-week remediation roadmap
- Governance recommendations to prevent recurrence

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/crm-data-quality-enforcer
```

---

## Commands

```
/crm-data-quality-enforcer:audit    — Full data quality audit
/crm-data-quality-enforcer:consent  — GDPR/consent compliance check only
```

---

## Quality Dimensions Covered

Completeness · Consistency · Validity · Uniqueness · Accuracy · Consent Compliance · Referential Integrity · Taxonomy Compliance

---

## CRM Support

Primary: **HubSpot** (with HubSpot-specific checks for lifecycle stage logic, marketing contact status, owner gaps)  
Also supports: Salesforce, generic CRM schemas

---

## License

MIT
