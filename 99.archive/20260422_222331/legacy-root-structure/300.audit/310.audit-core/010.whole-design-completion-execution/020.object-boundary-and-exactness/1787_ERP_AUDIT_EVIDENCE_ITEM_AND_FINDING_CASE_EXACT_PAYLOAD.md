# ============================================================
# ERP AUDIT EVIDENCE ITEM AND FINDING CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1787
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit.evidence_item_and_finding_case.exact_payload
component: audit-evidence-item-and-finding-case-exact-payload


# OBJECT 1

audit_evidence_item

Canonical payload:
- object_id
- company_id
- object_type = audit_evidence_item
- status
- evidence_item_code
- evidence_status_code
- linked_audit_engagement_id
- evidence_source_module_code
- evidence_source_object_reference_code
- evidence_type_code
- collected_at
- evidence_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

audit_finding_case

Canonical payload:
- object_id
- company_id
- object_type = audit_finding_case
- status
- finding_case_code
- finding_status_code
- linked_audit_engagement_id
- linked_evidence_item_id
- finding_severity_code
- finding_category_code
- detected_at
- remediation_owner_role_code
- created_at
- created_by
- updated_at
- updated_by

