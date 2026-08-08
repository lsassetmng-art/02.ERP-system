# ============================================================
# ERP LABORMANAGER EXACT PAYLOAD TRAINING AND COMPLIANCE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-768
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.exact_payload.training_and_compliance
component: labormanager-exact-payload-training-and-compliance


# OBJECT 1

labor_training_completion

Canonical payload:
- object_id
- company_id
- object_type = labor_training_completion
- status
- staff_profile_id
- training_code
- training_status_code
- assigned_at
- due_at
- completed_at
- completion_result_code
- assigned_by
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

labor_compliance_check_result

Canonical payload:
- object_id
- company_id
- object_type = labor_compliance_check_result
- status
- staff_profile_id
- compliance_check_code
- compliance_result_code
- checked_at
- expires_at
- issue_count
- blocking_flag
- checked_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Training completion and compliance result are related
but not interchangeable.
A passed training record is not automatically a full compliance pass.

