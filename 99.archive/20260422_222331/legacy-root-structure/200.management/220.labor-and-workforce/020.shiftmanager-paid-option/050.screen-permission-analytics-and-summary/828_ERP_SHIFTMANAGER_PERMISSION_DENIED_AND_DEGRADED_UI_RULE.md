# ============================================================
# ERP SHIFTMANAGER PERMISSION DENIED AND DEGRADED UI RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-828
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.permission_denied_and_degraded_ui.rule
component: shiftmanager-permission-denied-and-degraded-ui-rule


# DENIED BEHAVIOR

When permission is absent, UI should behave as:
- hidden when irrelevant
or
- disabled with reason when explainability matters
or
- redirected to permission_denied screen when screen-level access is absent


# DEGRADED BEHAVIOR

When partial permission exists, UI may degrade by:
- read-only roster view instead of planner board
- hidden publication controls
- hidden swap review controls
- hidden export controls

