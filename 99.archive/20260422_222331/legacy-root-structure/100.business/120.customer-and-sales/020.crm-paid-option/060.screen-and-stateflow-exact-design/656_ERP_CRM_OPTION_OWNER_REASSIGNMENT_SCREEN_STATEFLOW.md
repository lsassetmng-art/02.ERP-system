# ============================================================
# ERP CRM OPTION OWNER REASSIGNMENT SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-656
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.owner_reassignment_screen.stateflow
component: crm-option-owner-reassignment-screen-stateflow


# PRIMARY STATES

- reassignment_ready
- reassignment_confirmation_required
- reassignment_submitting
- reassignment_saved
- reassignment_failed
- permission_denied
- handoff_attention_required


# REQUIRED FORM ELEMENTS

- next_owner_user_id
- reassignment_reason_code
- reassignment_note

Optional assistive elements:
- pending inquiry count
- pending followup count
- last interaction summary


# RULE

Owner reassignment screen should communicate that
this is responsibility transfer, not just field edit.

