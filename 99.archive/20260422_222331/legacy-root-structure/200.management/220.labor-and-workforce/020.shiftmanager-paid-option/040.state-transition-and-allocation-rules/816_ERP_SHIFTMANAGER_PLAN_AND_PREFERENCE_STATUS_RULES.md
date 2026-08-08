# ============================================================
# ERP SHIFTMANAGER PLAN AND PREFERENCE STATUS RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-816
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.plan_and_preference.status_rules
component: shiftmanager-plan-and-preference-status-rules


# PLAN STATUS SET

- draft
- collecting_preferences
- assignment_in_progress
- ready_for_publication
- published
- locked
- archived
- canceled


# PREFERENCE STATUS SET

- open
- submitted
- withdrawn
- reviewed
- closed


# RULE

Published and locked are not the same.
Closed preference window does not by itself publish the roster.

