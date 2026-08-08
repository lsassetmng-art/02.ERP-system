# ============================================================
# BUSINESS INTELLIGENCE POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. Boundary policy
- BI owns analytical projection truth
- source modules own business canon
- 52 owns shared reference truth
- BI may cache analytical snapshots but must not claim source ownership

## 2. Refresh policy
- published dashboards must point to reproducible snapshots
- failed refresh runs remain visible
- superseded snapshots remain historically available where needed

## 3. Drill-down policy
- drill-down should reference source-owned surfaces
- broken links must be surfaced explicitly
- BI does not silently invent missing source canon

## 4. KPI policy
- KPI definitions are centrally managed
- KPI changes must remain historically traceable
