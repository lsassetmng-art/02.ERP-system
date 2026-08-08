# ============================================================
# ERP MRP PLANNED ORDER RECOMMENDATION EXCEPTION STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-952
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.planned_order_recommendation_exception.screen_stateflow
component: mrp-planned-order-recommendation-exception-screen-stateflow


# PRIMARY STATES

- board_loading
- board_ready
- recommendation_ready
- exception_ready
- conversion_confirmation_required
- override_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Recommendation accept, conversion, and exception resolution
must remain separate controlled flows.

