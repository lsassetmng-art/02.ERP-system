# ============================================================
# ERP MRP DEMAND BOM RUN SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-951
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.demand_bom_run.screen_stateflow
component: mrp-demand-bom-run-screen-stateflow


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- demand_edit_dirty
- bom_edit_dirty
- run_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Demand freeze release and BOM activation must not bypass
governance through ordinary edit save.

