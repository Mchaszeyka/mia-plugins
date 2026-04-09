# Mia Plugins — Testing Guide

This document tells you exactly how to test all 10 plugins before pushing to GitHub.
There are three test layers. Run them in order.

---

## Layer 1: Structure Check (No Claude Code required)
## Layer 2: Smoke Test (Requires Claude Code)
## Layer 3: Output Quality Check (Requires Claude Code)

---

## Setup

```bash
# Clone or unzip the repo
cd mia-plugins

# Verify Claude Code is installed
claude --version

# Run the bash structure checker (Layer 1)
bash test-structure.sh
```

---

## Layer 1: Structure Check

Run `test-structure.sh` (included in this repo). It validates every plugin has the required files and correct JSON before you load anything.

**What it checks per plugin:**
- [ ] `.claude-plugin/plugin.json` exists and is valid JSON
- [ ] `plugin.json` has required fields: `name`, `description`, `version`, `author`
- [ ] `skills/<name>/SKILL.md` exists
- [ ] `SKILL.md` has frontmatter (`---` block at top)
- [ ] `SKILL.md` has `description` field in frontmatter
- [ ] `commands/` directory exists with at least one `.md` file
- [ ] Each command `.md` has a `description` field in frontmatter
- [ ] `README.md` exists
- [ ] Plugin `name` in `plugin.json` matches directory name

**Pass:** All checks green  
**Warn:** README missing or command missing description (non-blocking)  
**Fail:** Missing `plugin.json`, missing `SKILL.md`, invalid JSON, missing required fields

---

## Layer 2: Smoke Test

Load each plugin and run its primary slash command with the test input below.
The goal is to confirm the plugin loads without errors and the command fires.

### How to load a plugin for testing

```bash
# Load a single plugin
claude --plugin-dir ./gtm-brief-generator

# Then inside Claude Code:
/gtm-brief-generator:brief [test input]

# Load all plugins at once (for cross-plugin testing)
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

### Smoke test inputs (one per plugin)

| Plugin | Command | Test Input |
|---|---|---|
| gtm-brief-generator | `/gtm-brief-generator:brief` | See GTM test input below |
| email-performance-debrief | `/email-performance-debrief:analyze` | See Email test input below |
| win-loss-synthesizer | `/win-loss-synthesizer:analyze` | See Win/Loss test input below |
| persona-content-matrix | `/persona-content-matrix:map` | See Persona test input below |
| launch-readiness-agent | `/launch-readiness-agent:plan` | See Launch test input below |
| nurture-sequence-architect | `/nurture-sequence-architect:build` | See Nurture test input below |
| campaign-attribution-auditor | `/campaign-attribution-auditor:audit` | See Attribution test input below |
| crm-data-quality-enforcer | `/crm-data-quality-enforcer:audit` | See CRM test input below |
| segment-health-monitor | `/segment-health-monitor:check` | See Segment test input below |
| icp-signal-scanner | `/icp-signal-scanner:scan` | See ICP test input below |

---

## Test Inputs

### GTM Brief Generator
```
Product: HubSpot + Segment Real-Time Sync
Description: A new integration that syncs real-time product usage data from Segment into HubSpot contact records. Updates lifecycle stage automatically based on usage thresholds. Requires both HubSpot and Segment.
Target: B2B SaaS companies, 50-500 employees, already using HubSpot and Segment.
Goal: Drive adoption among existing HubSpot customers who have Segment.
```

**Expected output sections:**
- [ ] One-line positioning statement
- [ ] Target segment (primary, secondary, excluded)
- [ ] Problem statement
- [ ] Key messages by persona (at least 2 personas)
- [ ] Sales talking points (at least 5)
- [ ] Objection handlers (at least 3)
- [ ] Channel mix table
- [ ] Launch assets checklist
- [ ] Success metrics table

---

### Email Performance Debrief
```
Campaign: KubeCon EU 2026 Pre-Show Email #3
Audience type: Event (Major)
List size: 8,400
Open rate: 6.1%
CTR: 0.9%
Unsubscribe rate: 0.61%
Conversions (registrations): 142
Send date: 2 weeks before event
Subject line: "3 sessions you can't miss at KubeCon EU"
```

**Expected output sections:**
- [ ] Performance summary table with RAG status
- [ ] Benchmark comparison (should compare against 8.1% open / 2.2% CTR / 0.44% unsub)
- [ ] Root cause assessment with Fact/Inference labels
- [ ] At least 3 ranked optimizations with Impact/Effort
- [ ] What to keep section
- [ ] Next send recommendation

**Key checks:**
- [ ] Open rate flagged as 🔴 (6.1% vs 8.1% benchmark)
- [ ] CTR flagged as 🔴 (0.9% vs 2.2% benchmark)
- [ ] Unsub rate flagged as 🔴 (0.61% vs 0.44% benchmark)
- [ ] Root cause identifies subject line AND list fatigue as likely factors

---

### Win/Loss Synthesizer
```
Interview 1 — LOSS
Company: Acme Corp (200 employees, B2B SaaS)
Outcome: Lost to Competitor X
Decision maker: VP Marketing
Key quotes: "Competitor X had better HubSpot integration out of the box." "Your onboarding took 6 weeks, theirs was 2." "Price was similar but implementation risk felt lower with them."
Other factors: IT team preferred Competitor X's SSO support. Champion left mid-deal.

Interview 2 — LOSS  
Company: Beta Inc (350 employees, Fintech)
Outcome: Lost to Competitor X
Decision maker: CMO
Key quotes: "We needed something our team could set up without involving engineering." "Competitor X had a self-serve onboarding flow." "Your product looked more powerful but we couldn't get it live fast enough."
Other factors: Compliance team required SOC 2 Type II documentation — we provided it late.
```

**Expected output sections:**
- [ ] Executive summary
- [ ] Loss patterns with frequency (onboarding speed should appear as 2/2)
- [ ] Competitive signals for Competitor X
- [ ] Objection handlers for "implementation complexity"
- [ ] Recommended actions with owners

**Key checks:**
- [ ] "Onboarding speed" identified as pattern across both interviews
- [ ] "HubSpot integration" flagged as competitive gap
- [ ] "Champion departure" noted as deal risk
- [ ] Compliance/SOC 2 delay flagged as process issue

---

### Persona-to-Content Matrix
```
Personas:
1. Marketing Ops Manager — Pain: manual reporting, broken tracking, too much time in spreadsheets. Goal: automate reporting, prove channel ROI. Enters funnel: MOFU (searching for solutions).
2. VP Marketing — Pain: can't defend budget without attribution data. Goal: show pipeline contribution. Enters funnel: BOFU (evaluating vendors).
3. Demand Gen Manager — Pain: email performance declining, not sure why. Goal: improve open rates and pipeline from email. Enters funnel: TOFU (searching for tips).

Content inventory:
- Blog: "5 Ways to Improve Email Open Rates" (TOFU, Demand Gen)
- Blog: "What is Marketing Attribution?" (TOFU, general)
- Case study: "How Acme Increased Pipeline by 40%" (BOFU, VP Marketing)
- Webinar recording: "HubSpot Best Practices 2025" (MOFU, Marketing Ops)
```

**Expected output sections:**
- [ ] Gap matrix (3 personas × 4 funnel stages = 12 cells)
- [ ] At least 3 gaps flagged as HIGH priority
- [ ] At least 5 content briefs
- [ ] Quick wins section
- [ ] Strategic recommendations

**Key checks:**
- [ ] Marketing Ops TOFU gap identified (no awareness content for this persona)
- [ ] VP Marketing TOFU and MOFU gaps identified
- [ ] Each content brief has: type, persona, stage, objective, key message, CTA

---

### Launch Readiness Agent
```
Launch: Email Performance Debrief Plugin v1.0
Launch date: May 1, 2026 (3 weeks away)
Launch type: Product (open source plugin)
Teams involved: Product (1 person — me), Marketing (me), GitHub (distribution)
Goal: 100 installs in first 30 days, submit to Anthropic plugin directory
Assets needed: README, demo video or GIF, LinkedIn announcement post, Anthropic submission form
```

**Expected output sections:**
- [ ] Launch brief summary
- [ ] Readiness checklist (even if small team — should have tasks per function)
- [ ] Critical path items
- [ ] Missing assets explicitly called out
- [ ] T-minus timeline
- [ ] Launch day runbook

**Key checks:**
- [ ] Anthropic submission form flagged as a task
- [ ] Demo asset (video/GIF) flagged as missing or needed
- [ ] T-minus correctly calculates from today to May 1

---

### Nurture Sequence Architect
```
ICP: Marketing Ops Managers at B2B SaaS companies, 50-500 employees, using HubSpot
Offer: Free Claude Cowork plugin suite (this repo) — drives awareness of Mia Chaszeyka as AI PM
Funnel stage: Cold leads — downloaded a resource or attended a webinar, not yet engaged with portfolio
Sequence type: Lead nurture
CRM: HubSpot
Goal: Drive portfolio site visits and LinkedIn connection requests
Length: 5 emails max
```

**Expected output sections:**
- [ ] Sequence goal (primary + secondary)
- [ ] HubSpot enrollment criteria
- [ ] Suppression rules
- [ ] Sequence map table (5 emails)
- [ ] At least 3 email briefs with subject line A/B options
- [ ] Branch logic
- [ ] Exit criteria
- [ ] A/B test plan
- [ ] Success metrics

**Key checks:**
- [ ] Re-enrollment setting addressed
- [ ] Suppression includes "already connected on LinkedIn"
- [ ] Each email brief has preview text (50 chars)
- [ ] At least one branch: IF clicked → do X / IF no click by Day N → do Y

---

### Campaign Attribution Auditor
```
Tech stack: HubSpot CRM, GA4, Segment CDP, WordPress on WP Engine (CDN)
Consent banner: OneTrust, deployed March 2026
Known symptoms:
- GA4 shows 850 conversions in Q1, HubSpot shows 3,200 form submissions
- Direct/none traffic is 58% of GA4 sessions
- utm_source is missing on ~30% of HubSpot contacts
- Consent rejection rate: 72% (EU traffic heavy — developer audience)

Channels running: LinkedIn Ads, email, organic search, event sponsorships
```

**Expected output sections:**
- [ ] Executive summary with estimated revenue at risk
- [ ] Attribution coverage score (should be ~26% — 850/3200)
- [ ] Issues ranked by revenue impact
- [ ] UTM hygiene report
- [ ] Consent/GDPR loss analysis
- [ ] Fix roadmap

**Key checks:**
- [ ] Coverage score calculated: 850 ÷ 3,200 = 26.6% — should be flagged as CRITICAL (below 50% threshold)
- [ ] Consent rejection at 72% flagged as structural problem requiring server-side tracking
- [ ] CDN/WordPress architecture identified as likely JS blocking issue
- [ ] utm_source gap (30% missing) quantified
- [ ] At least one fix labeled "Engineering" owner

---

### CRM Data Quality Enforcer
```
CRM: HubSpot
Export sample (describe, don't paste CSV):
- 500 contacts
- 23% missing First Name
- 41% missing Lead Source
- 87 contacts have Lifecycle Stage = "Customer" but no Close Date
- 12 contacts have email addresses with spaces (e.g., "john @acme.com")
- 156 EU contacts — 34 have no Legal Basis field populated
- Job Title has 47 unique variations of "VP Marketing" (VP Marketing, VP, Marketing, vp of marketing, etc.)
- 8 exact email duplicates
```

**Expected output sections:**
- [ ] Data quality scorecard (0–100)
- [ ] Critical issues section (GDPR violation should be #1)
- [ ] Field-level remediation log
- [ ] Duplicate analysis
- [ ] Consent compliance status
- [ ] Taxonomy/picklist violations
- [ ] Remediation roadmap

**Key checks:**
- [ ] 34 EU contacts without Legal Basis flagged as CRITICAL compliance risk
- [ ] 8 email duplicates identified with merge recommendation
- [ ] Job Title taxonomy violations listed (47 variations noted)
- [ ] "Customer" without Close Date flagged as referential integrity issue
- [ ] Score should be below 70 given these issues

---

### Segment Health Monitor
```
Pre-send check for: KubeCon NA 2026 email campaign (3 sends simultaneously)

Segment 1: KubeCon NA Registered — 4,200 contacts (last known: 4,180 two weeks ago)
Segment 2: KubeCon NA Waitlist — 892 contacts (last known: 1,240 one month ago)  
Segment 3: KubeCon NA Speakers — 87 contacts (last known: 89 two weeks ago)

Suppression: Global unsubscribes applied. No customer suppression applied.
Consent: EU contacts = ~35% of list. Legal basis field present on 94% of EU contacts.
CDP: Segment.com. Last sync: 6 hours ago (send is in 2 hours).
```

**Expected output sections:**
- [ ] Overall clearance status
- [ ] Segment-by-segment table with RAG status
- [ ] RED/YELLOW/GREEN breakdown with reasoning
- [ ] Overlap matrix for simultaneous sends
- [ ] Consent coverage section
- [ ] CDP sync status

**Key checks:**
- [ ] Segment 2 (Waitlist) flagged YELLOW or RED — 28% size drop (892 vs 1,240) exceeds 20% threshold
- [ ] Missing customer suppression flagged — contacts who registered shouldn't get waitlist email
- [ ] CDP sync at 6 hours flagged as YELLOW (exceeds 4-hour threshold)
- [ ] EU consent gap (6% without legal basis) flagged
- [ ] Overlap check run across all 3 simultaneous sends

---

### ICP Signal Scanner
```
ICP: B2B SaaS companies, 50-500 employees, Marketing Ops or RevOps function, using HubSpot

Target accounts:
1. Drift (conversational marketing platform)
2. Clearbit (B2B data enrichment)
3. Metadata.io (demand gen automation)
4. Qualified (pipeline automation — note: Mia has active application here)
5. 6sense (account engagement platform)

Signal window: Last 90 days
Focus: Funding, executive hires, HubSpot partnership announcements
```

**Expected output sections:**
- [ ] Priority outreach list ranked by score
- [ ] Signal cards for accounts with score ≥ 3
- [ ] Accounts with no signal section
- [ ] Pattern observations
- [ ] Recommended follow-up actions

**Key checks:**
- [ ] Each account has a score (0–10)
- [ ] Recommended outreach angle is specific (not generic "reach out about our product")
- [ ] No fabricated signals — if web search not available, clearly states "no confirmed signal"
- [ ] Qualified.com noted with appropriate context (active application — flag for awareness)

---

## Layer 3: Output Quality Rubric

For each plugin, score the output against these criteria:

| Criterion | Pass | Warn | Fail |
|---|---|---|---|
| **Completeness** | All expected sections present | 1 section missing or thin | 2+ sections missing |
| **Specificity** | Recommendations are actionable, not generic | Some vague language | Mostly generic advice |
| **Accuracy** | Benchmarks/calculations correct where applicable | Minor rounding | Wrong benchmark used or math error |
| **Fact/Inference labeling** | Labels used correctly | Inconsistent use | No labeling at all |
| **Format** | Clean Markdown, tables render correctly | Minor formatting issue | Broken Markdown |
| **No hallucination** | All claims traceable to input | 1 minor unsupported claim | Fabricated data or signals |

---

## Recording Results

After all tests, write `test-results.md` in this format:

```markdown
# Test Results — mia-plugins v1.0.0
Date: [today]
Tester: Claude Code

## Summary
| Plugin | Structure | Smoke Test | Output Quality | Status |
|---|---|---|---|---|
| gtm-brief-generator | PASS | PASS | PASS | ✅ READY |
| ... | | | | |

## Failures / Warnings
[List any FAIL or WARN with specific details]

## Release Decision
[ ] All 10 plugins READY — push to GitHub
[ ] Blocked — fix issues listed above before release
```

---

## Common Issues & Fixes

| Issue | Likely Cause | Fix |
|---|---|---|
| Plugin not found after `--plugin-dir` | Wrong path or `.claude-plugin/plugin.json` missing | Check directory name matches exactly |
| Command not showing in `/` menu | `commands/` not at plugin root (not inside `.claude-plugin/`) | Move `commands/` to plugin root |
| Skill not triggering automatically | Description too vague or too long (truncated at 250 chars) | Shorten description, front-load key use case |
| JSON parse error | Trailing comma or unescaped character in `plugin.json` | Run `python3 -m json.tool plugin.json` to validate |
| Output missing sections | Skill instructions not specific enough | Add explicit numbered section list to SKILL.md |
| Subagent not activating | Agent `.md` not in `agents/` at plugin root | Check path: `<plugin>/agents/<name>.md` |
