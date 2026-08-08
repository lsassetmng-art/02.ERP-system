# ============================================================
# ERP SFA OPTION STATE TRANSITION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-739
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.state_transition.current_state
component: sfa-option-state-transition-current-state


# ABSTRACT

Defines the current state for the first exact
state-transition and pipeline-rule pass for the
SFA paid option.

This pass fixes:
- lead qualification states
- opportunity stage progression
- action completion states
- won / lost / reopen rules
- audit-sensitive transition treatment

