# ============================================================
# ERP QUALITY NONCONFORMANCE CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2719
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_nonconformance_case.exact_payload
component: quality-nonconformance-case-exact-payload


# OBJECT

quality_nonconformance_case

Canonical payload:
- object_id
- company_id
- object_type = quality_nonconformance_case
- status
- quality_nonconformance_case_code
- nonconformance_status_code
- linked_quality_inspection_case_id
- nonconformance_type_code
- nonconformance_severity_code
- affected_item_reference_code
- affected_quantity
- disposition_code
- discovered_at
- nonconformance_summary_text
- created_at
- created_by
- updated_at
- updated_by

