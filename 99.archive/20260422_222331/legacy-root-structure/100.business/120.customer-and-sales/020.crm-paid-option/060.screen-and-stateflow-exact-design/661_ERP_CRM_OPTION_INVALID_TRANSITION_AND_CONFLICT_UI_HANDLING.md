# ============================================================
# ERP CRM OPTION INVALID TRANSITION AND CONFLICT UI HANDLING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-661
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.invalid_transition_and_conflict_ui_handling
component: crm-option-invalid-transition-and-conflict-ui-handling


# PURPOSE

Defines the expected UI/state reaction when a requested
transition is rejected or conflicts with current state.


# REPRESENTATIVE SCREEN STATES

- invalid_transition_blocked
- stale_data_conflict_detected
- permission_changed_during_action
- option_state_changed_during_action
- audit_required_action_blocked


# RULES

If contract rejects a transition:
- the screen must not pretend save succeeded
- the user must see exact blocked reason

If stale data conflict is detected:
- show refresh/reload path
- preserve unsaved input where safe

If option enablement changed during action:
- flow must resolve to disabled or suspended handling state

