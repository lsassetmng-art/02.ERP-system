# ============================================================
# ERP MRP STATE TRANSITION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-943
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.state_transition.current_state
component: mrp-state-transition-current-state


# ABSTRACT

Defines the current state for the first exact
state-transition and planning-governance-rule pass for the
MRP paid option.

This pass fixes:
- demand and BOM lifecycle transitions
- run and planned order governance
- recommendation and exception status treatment
- audit-sensitive planning overrides

