# ============================================================
# ERP WMS PICK COUNT DISCREPANCY SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-992
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.pick_count_discrepancy.screen_stateflow
component: wms-pick-count-discrepancy-screen-stateflow


# PRIMARY STATES

- board_loading
- board_ready
- pick_ready
- count_ready
- discrepancy_ready
- conversion_confirmation_required
- override_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Dispatch confirmation, count closure, and discrepancy resolution
must remain separate controlled flows.

