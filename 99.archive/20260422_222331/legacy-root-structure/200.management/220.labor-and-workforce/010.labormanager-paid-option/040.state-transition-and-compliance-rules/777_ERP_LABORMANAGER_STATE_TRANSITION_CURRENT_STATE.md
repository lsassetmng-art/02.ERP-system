# ============================================================
# ERP LABORMANAGER STATE TRANSITION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-777
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.state_transition.current_state
component: labormanager-state-transition-current-state


# ABSTRACT

Defines the current state for the first exact
state-transition and compliance-rule pass for the
LaborManager paid option.

This pass fixes:
- attendance correction and leave status models
- onboarding/offboarding progression
- training/compliance transitions
- audit-sensitive labor transition treatment

