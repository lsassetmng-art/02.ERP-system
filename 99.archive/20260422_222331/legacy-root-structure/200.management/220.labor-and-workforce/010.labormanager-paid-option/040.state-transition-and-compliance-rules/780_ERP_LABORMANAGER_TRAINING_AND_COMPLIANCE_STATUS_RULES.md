# ============================================================
# ERP LABORMANAGER TRAINING AND COMPLIANCE STATUS RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-780
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.training_and_compliance.status_rules
component: labormanager-training-and-compliance-status-rules


# TRAINING STATUS SET

- assigned
- in_progress
- completed
- expired
- waived
- canceled


# COMPLIANCE RESULT SET

- pass
- pass_with_expiry
- warning
- fail
- blocked


# RULE

A completed training item does not automatically
resolve all compliance blocking conditions.

A blocked compliance result may restrict downstream
labor operations depending on policy.

