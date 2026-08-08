# ============================================================
# ERP WMS STATE TRANSITION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-983
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.state_transition.current_state
component: wms-state-transition-current-state


# ABSTRACT

Defines the current state for the first exact
state-transition and warehouse-governance-rule pass for the
WMS paid option.

This pass fixes:
- warehouse/location lifecycle transitions
- inbound/outbound/movement governance
- count/discrepancy status treatment
- audit-sensitive warehouse overrides

