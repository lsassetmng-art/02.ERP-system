# ============================================================
# ERP LABORMANAGER TRAINING COMPLIANCE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-774
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.training_compliance_contracts
component: labormanager-training-compliance-contracts


# TRAINING ASSIGN REQUEST BODY

- staff_profile_id
- training_code
- due_at


# TRAINING COMPLETE REQUEST BODY

- object_id
- completed_at
- completion_result_code


# COMPLIANCE CHECK REQUEST BODY

- staff_profile_id
- compliance_check_code
- checked_at
- expires_at
- issue_count
- blocking_flag


# RULE

Compliance result recording must not be hidden inside
generic staff update.

