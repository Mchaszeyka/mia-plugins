# Persona-to-Content Matrix — Claude Cowork Plugin

Maps your content inventory against personas and funnel stages to surface the gaps that matter most for pipeline. Outputs a visual gap matrix and a prioritized, ready-to-assign content brief backlog.

**Built by:** [Mia Chaszeyka](https://miachaszeyka.com) — Marketing Operations & AI PM

---

## What It Does

Provide your persona definitions and content inventory. Get back:

- A gap matrix (personas × funnel stages) showing what's covered, partial, or missing
- Gaps ranked by pipeline impact
- Ready-to-assign content briefs for the top 5–8 gaps
- Quick wins — existing content that can be repurposed
- Strategic recommendations for the overall program

No more blank-spreadsheet content audits. No more guessing what to build next.

---

## Installation

```bash
/plugin install https://github.com/miachaszeyka/mia-plugins/persona-content-matrix
```

---

## Usage

```
/persona-content-matrix:map [paste personas + content inventory]
```

### Minimum viable input
- **Personas:** Job title, pain points, goals, funnel stage they typically enter
- **Content inventory:** List of existing content with type and target audience (rough is fine)

If you only have personas, the plugin will assume zero existing content and build from scratch.

---

## License

MIT
