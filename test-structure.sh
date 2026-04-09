#!/usr/bin/env bash
# test-structure.sh
# Layer 1: Structure validation for all mia-plugins
# Run from the mia-plugins root directory: bash test-structure.sh

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PASS=0
WARN=0
FAIL=0
TOTAL=0

plugins=(
  "gtm-brief-generator"
  "email-performance-debrief"
  "win-loss-synthesizer"
  "persona-content-matrix"
  "launch-readiness-agent"
  "nurture-sequence-architect"
  "campaign-attribution-auditor"
  "crm-data-quality-enforcer"
  "segment-health-monitor"
  "icp-signal-scanner"
)

check() {
  local label="$1"
  local result="$2"   # pass | warn | fail
  local detail="$3"
  TOTAL=$((TOTAL + 1))
  if [ "$result" = "pass" ]; then
    echo -e "  ${GREEN}✓${NC} $label"
    PASS=$((PASS + 1))
  elif [ "$result" = "warn" ]; then
    echo -e "  ${YELLOW}⚠${NC} $label — $detail"
    WARN=$((WARN + 1))
  else
    echo -e "  ${RED}✗${NC} $label — $detail"
    FAIL=$((FAIL + 1))
  fi
}

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Mia Plugins — Layer 1: Structure Check${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

for plugin in "${plugins[@]}"; do
  echo -e "${BLUE}▸ $plugin${NC}"
  plugin_dir="./$plugin"

  # 1. Directory exists
  if [ ! -d "$plugin_dir" ]; then
    check "Plugin directory exists" "fail" "Directory ./$plugin not found"
    echo ""
    continue
  fi
  check "Plugin directory exists" "pass" ""

  # 2. plugin.json exists
  plugin_json="$plugin_dir/.claude-plugin/plugin.json"
  if [ ! -f "$plugin_json" ]; then
    check ".claude-plugin/plugin.json exists" "fail" "File not found at $plugin_json"
    echo ""
    continue
  fi
  check ".claude-plugin/plugin.json exists" "pass" ""

  # 3. plugin.json is valid JSON
  if python3 -m json.tool "$plugin_json" > /dev/null 2>&1; then
    check "plugin.json is valid JSON" "pass" ""
  else
    check "plugin.json is valid JSON" "fail" "JSON parse error — run: python3 -m json.tool $plugin_json"
    echo ""
    continue
  fi

  # 4. Required fields in plugin.json
  name_val=$(python3 -c "import json; d=json.load(open('$plugin_json')); print(d.get('name','MISSING'))")
  desc_val=$(python3 -c "import json; d=json.load(open('$plugin_json')); print(d.get('description','MISSING'))")
  ver_val=$(python3 -c "import json; d=json.load(open('$plugin_json')); print(d.get('version','MISSING'))")

  [ "$name_val" != "MISSING" ] && check "name field present" "pass" "" || check "name field present" "fail" "Missing 'name' in plugin.json"
  [ "$desc_val" != "MISSING" ] && check "description field present" "pass" "" || check "description field present" "fail" "Missing 'description' in plugin.json"
  [ "$ver_val" != "MISSING" ] && check "version field present" "pass" "" || check "version field present" "fail" "Missing 'version' in plugin.json"

  # 5. Plugin name matches directory name
  if [ "$name_val" = "$plugin" ]; then
    check "plugin name matches directory" "pass" ""
  else
    check "plugin name matches directory" "warn" "plugin.json name='$name_val' but directory is '$plugin'"
  fi

  # 6. skills/ directory exists with at least one SKILL.md
  skills_dir="$plugin_dir/skills"
  if [ ! -d "$skills_dir" ]; then
    check "skills/ directory exists" "fail" "No skills/ directory at plugin root"
  else
    skill_count=$(find "$skills_dir" -name "SKILL.md" | wc -l | tr -d ' ')
    if [ "$skill_count" -eq 0 ]; then
      check "at least one SKILL.md exists" "fail" "skills/ directory exists but no SKILL.md found"
    else
      check "at least one SKILL.md exists ($skill_count found)" "pass" ""

      # 7. Each SKILL.md has frontmatter
      while IFS= read -r -d '' skillfile; do
        rel="${skillfile#./}"
        first_line=$(head -1 "$skillfile")
        if [ "$first_line" = "---" ]; then
          check "$rel has frontmatter" "pass" ""
          # 8. SKILL.md has description in frontmatter
          if grep -q "^description:" "$skillfile"; then
            check "$rel has description field" "pass" ""
          else
            check "$rel has description field" "warn" "No 'description:' in frontmatter — Claude won't auto-invoke this skill"
          fi
        else
          check "$rel has frontmatter" "fail" "File does not start with '---'"
        fi
      done < <(find "$skills_dir" -name "SKILL.md" -print0)
    fi
  fi

  # 9. commands/ directory exists with at least one .md file
  commands_dir="$plugin_dir/commands"
  if [ ! -d "$commands_dir" ]; then
    check "commands/ directory exists" "warn" "No commands/ directory — plugin will only work via natural language"
  else
    cmd_count=$(find "$commands_dir" -name "*.md" | wc -l | tr -d ' ')
    if [ "$cmd_count" -eq 0 ]; then
      check "at least one command .md exists" "warn" "commands/ directory exists but no .md files found"
    else
      check "at least one command .md exists ($cmd_count found)" "pass" ""

      # 10. Each command .md has description in frontmatter
      while IFS= read -r -d '' cmdfile; do
        rel="${cmdfile#./}"
        if grep -q "^description:" "$cmdfile"; then
          check "$rel has description field" "pass" ""
        else
          check "$rel has description field" "warn" "No 'description:' in frontmatter"
        fi
      done < <(find "$commands_dir" -name "*.md" -print0)
    fi
  fi

  # 11. README.md exists
  if [ -f "$plugin_dir/README.md" ]; then
    readme_lines=$(wc -l < "$plugin_dir/README.md")
    if [ "$readme_lines" -lt 10 ]; then
      check "README.md exists" "warn" "README only $readme_lines lines — consider expanding"
    else
      check "README.md exists ($readme_lines lines)" "pass" ""
    fi
  else
    check "README.md exists" "warn" "Missing README.md — required for marketplace submission"
  fi

  # 12. agents/ directory check (for medium/high complexity plugins)
  agents_dir="$plugin_dir/agents"
  if [ -d "$agents_dir" ]; then
    agent_count=$(find "$agents_dir" -name "*.md" | wc -l | tr -d ' ')
    check "agents/ directory exists ($agent_count agents)" "pass" ""
  fi

  echo ""
done

# Summary
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  Results: ${GREEN}$PASS passed${NC} · ${YELLOW}$WARN warnings${NC} · ${RED}$FAIL failed${NC} · $TOTAL total checks"
echo ""

if [ "$FAIL" -gt 0 ]; then
  echo -e "  ${RED}✗ BLOCKED — fix $FAIL failure(s) before proceeding to Layer 2${NC}"
  exit 1
elif [ "$WARN" -gt 0 ]; then
  echo -e "  ${YELLOW}⚠ PASS WITH WARNINGS — $WARN non-blocking issue(s) found${NC}"
  echo -e "  ${YELLOW}  Proceed to Layer 2 (Smoke Test) but review warnings${NC}"
  exit 0
else
  echo -e "  ${GREEN}✓ ALL CHECKS PASSED — proceed to Layer 2 (Smoke Test)${NC}"
  exit 0
fi
