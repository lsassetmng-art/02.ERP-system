# ============================================================
# ERP SCM STATE TRANSITION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1023
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.state_transition.current_state
component: scm-state-transition-current-state


# ABSTRACT

Defines the current state for the first exact
state-transition and network-governance-rule pass for the
SCM paid option.

This pass fixes:
- network, supplier, and lane lifecycle transitions
- supply plan and replenishment governance
- disruption and resilience status treatment
- audit-sensitive network overrides

