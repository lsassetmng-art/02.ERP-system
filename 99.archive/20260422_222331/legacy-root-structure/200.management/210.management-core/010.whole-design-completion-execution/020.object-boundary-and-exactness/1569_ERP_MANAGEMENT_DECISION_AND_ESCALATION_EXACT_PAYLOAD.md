# ============================================================
# ERP MANAGEMENT DECISION AND ESCALATION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1569
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.decision_and_escalation.exact_payload
component: management-decision-and-escalation-exact-payload


# OBJECT 1

management_decision_record

Canonical payload:
- object_id
- company_id
- object_type = management_decision_record
- status
- decision_record_code
- decision_status_code
- decision_type_code
- decision_at
- linked_review_cycle_id
- decision_summary_text
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

management_escalation_case

Canonical payload:
- object_id
- company_id
- object_type = management_escalation_case
- status
- escalation_case_code
- escalation_status_code
- escalation_reason_code
- linked_source_module_code
- linked_source_object_reference_code
- escalated_at
- created_at
- created_by
- updated_at
- updated_by

