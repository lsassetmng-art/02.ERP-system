# ============================================================
# ERP LABOR COMPLIANCE CHECK EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2416
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labor_compliance_check_case.exact_payload
component: labor-compliance-check-case-exact-payload


# OBJECT

labor_compliance_check_case

Canonical payload:
- object_id
- company_id
- object_type = labor_compliance_check_case
- status
- labor_compliance_check_case_code
- compliance_check_status_code
- linked_labor_staff_profile_id
- compliance_check_type_code
- compliance_check_period_code
- violation_flag
- remediation_required_flag
- checked_at
- checked_by_reference_code
- created_at
- created_by
- updated_at
- updated_by

