# ============================================================
# ERP LABOR EMPLOYMENT LIFECYCLE AND COMPLIANCE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1644
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labor.employment_lifecycle_and_compliance.exact_payload
component: labor-employment-lifecycle-and-compliance-exact-payload


# OBJECT 1

labor_employment_lifecycle_case

Canonical payload:
- object_id
- company_id
- object_type = labor_employment_lifecycle_case
- status
- lifecycle_case_code
- lifecycle_status_code
- staff_profile_id
- lifecycle_case_type_code
- effective_date
- lifecycle_reason_code
- linked_manager_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

labor_compliance_case

Canonical payload:
- object_id
- company_id
- object_type = labor_compliance_case
- status
- compliance_case_code
- compliance_status_code
- staff_profile_id
- compliance_category_code
- detected_at
- compliance_reason_code
- linked_source_reference_code
- created_at
- created_by
- updated_at
- updated_by

