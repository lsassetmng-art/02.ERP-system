# ============================================================
# ERP MANAGEMENT REVIEW CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2250
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_review_case.exact_payload
component: management-review-case-exact-payload


# OBJECT

management_review_case

Canonical payload:
- object_id
- company_id
- object_type = management_review_case
- status
- management_review_case_code
- review_status_code
- review_type_code
- linked_business_reference_code
- linked_accounting_reference_code
- review_scope_code
- reviewer_reference_code
- review_requested_at
- review_due_at
- review_summary_text
- created_at
- created_by
- updated_at
- updated_by

