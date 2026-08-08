# ============================================================
# ERP EPM OBJECTIVE KPI SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-863
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.objective_kpi.screen_stateflow
component: epm-objective-kpi-screen-stateflow


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- objective_edit_dirty
- kpi_edit_dirty
- transition_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Objective hierarchy editing must not bypass lifecycle rules.
KPI definition update must not masquerade as scorecard edit.

