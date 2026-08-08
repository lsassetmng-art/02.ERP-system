# ============================================================
# ERP PRODUCTION COMPLETION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2566
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.production_completion_case.exact_payload
component: production-completion-case-exact-payload


# OBJECT

production_completion_case

Canonical payload:
- object_id
- company_id
- object_type = production_completion_case
- status
- production_completion_case_code
- completion_status_code
- linked_production_order_case_id
- linked_production_execution_case_id
- completed_quantity
- rejected_quantity
- completion_effective_at
- inventory_handoff_state_code
- accounting_handoff_state_code
- completion_summary_text
- created_at
- created_by
- updated_at
- updated_by

