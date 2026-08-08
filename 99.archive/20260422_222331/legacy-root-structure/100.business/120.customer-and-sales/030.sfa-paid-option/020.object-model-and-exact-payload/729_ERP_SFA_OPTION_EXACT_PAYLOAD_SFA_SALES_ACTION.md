# ============================================================
# ERP SFA OPTION EXACT PAYLOAD SFA SALES ACTION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-729
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.exact_payload.sfa_sales_action
component: sfa-option-exact-payload-sfa-sales-action


# OBJECT

sfa_sales_action


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = sfa_sales_action
- status
- related_lead_id
- related_opportunity_id
- owner_user_id
- action_type_code
- action_subject
- action_due_at
- action_completed_at
- action_result_code
- action_priority_code
- action_note_summary
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# RULE

Sales action is not the same as interaction log.
It is SFA execution planning / follow-through truth.

