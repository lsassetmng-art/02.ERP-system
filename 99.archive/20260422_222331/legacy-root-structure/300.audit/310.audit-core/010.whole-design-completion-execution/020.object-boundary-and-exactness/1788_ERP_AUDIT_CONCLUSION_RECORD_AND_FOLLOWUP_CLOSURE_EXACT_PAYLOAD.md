# ============================================================
# ERP AUDIT CONCLUSION RECORD AND FOLLOWUP CLOSURE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1788
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit.conclusion_record_and_followup_closure.exact_payload
component: audit-conclusion-record-and-followup-closure-exact-payload


# OBJECT 1

audit_conclusion_record

Canonical payload:
- object_id
- company_id
- object_type = audit_conclusion_record
- status
- conclusion_record_code
- conclusion_status_code
- linked_audit_engagement_id
- conclusion_type_code
- concluded_at
- conclusion_summary_text
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

audit_followup_closure

Canonical payload:
- object_id
- company_id
- object_type = audit_followup_closure
- status
- followup_closure_code
- closure_status_code
- linked_finding_case_id
- linked_conclusion_record_id
- remediation_check_at
- closure_result_code
- closed_at
- created_at
- created_by
- updated_at
- updated_by

