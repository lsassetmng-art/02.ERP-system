# ============================================================
# ERP SFA OPTION SALES ACTION CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-736
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.sales_action_contracts
component: sfa-option-sales-action-contracts


# ACTION LIST REQUEST BODY

- related_lead_id
- related_opportunity_id
- owner_user_id_set
- action_type_code_set
- status_set
- due_from
- due_to
- page
- page_size


# ACTION WRITE BODY

- related_lead_id
- related_opportunity_id
- owner_user_id
- action_type_code
- action_subject
- action_due_at
- action_priority_code
- action_note_summary


# RULE

Action completion must be a distinct controlled action,
not only a generic update patch.

