# ============================================================
# PROJECT ACCOUNTING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 32.project-accounting

Entities:
- prj_budget
- prj_actual_attribution
- prj_wip_status
- prj_profitability_snapshot
- prj_close_control

Invariant:
- project snapshots remain traceable to accounting/costing source references
