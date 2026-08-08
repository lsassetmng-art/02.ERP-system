# ============================================================
# ERP COMPANY WIDE MBO OBJECTIVE CASCADE AND ASSIGNMENT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1717
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.objective_cascade_and_assignment.exact_payload
component: company-wide-mbo-objective-cascade-and-assignment-exact-payload


# OBJECT 1

company_wide_mbo_objective_cascade

Canonical payload:
- object_id
- company_id
- object_type = company_wide_mbo_objective_cascade
- status
- objective_cascade_code
- cascade_status_code
- linked_mbo_program_id
- source_objective_reference_code
- target_org_scope_code
- cascade_depth_code
- cascaded_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

company_wide_mbo_assignment_record

Canonical payload:
- object_id
- company_id
- object_type = company_wide_mbo_assignment_record
- status
- assignment_record_code
- assignment_status_code
- linked_objective_cascade_id
- assignee_scope_code
- assignee_reference_code
- assigned_target_value
- assignment_due_at
- created_at
- created_by
- updated_at
- updated_by

