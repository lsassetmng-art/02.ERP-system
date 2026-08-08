# ============================================================
# ERP CRM OPTION MERGE RESOLUTION SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-657
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.merge_resolution_screen.stateflow
component: crm-option-merge-resolution-screen-stateflow


# PRIMARY STATES

- candidate_comparison_loading
- candidate_comparison_ready
- field_resolution_ready
- precondition_failed
- merge_confirmation_required
- merge_submitting
- merge_completed
- merge_failed
- permission_denied


# REQUIRED VISIBILITY

The merge resolution screen should expose:

- primary object
- secondary object
- field-by-field resolution choice
- trace preservation flag
- merge reason


# RULE

Merge must never be represented as ordinary save.

After successful merge, source object route must become
trace-guided and non-editable as an active source object.

