# ============================================================
# ERP AUDIT REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1795
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit.request_response.contracts
component: audit-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

audit_engagement write:
- audit_scope_code
- audit_period_code
- planned_start_at
- planned_end_at
- audit_owner_role_code
- linked_plan_reference_code

audit_evidence_item write:
- linked_audit_engagement_id
- evidence_source_module_code
- evidence_source_object_reference_code
- evidence_type_code
- collected_at
- evidence_reference_code

audit_finding_case write:
- linked_audit_engagement_id
- linked_evidence_item_id
- finding_severity_code
- finding_category_code
- detected_at
- remediation_owner_role_code

audit_conclusion_record write:
- linked_audit_engagement_id
- conclusion_type_code
- concluded_at
- conclusion_summary_text

audit_followup_closure write:
- linked_finding_case_id
- linked_conclusion_record_id
- remediation_check_at
- closure_result_code
- closed_at

