# ============================================================
# ERP THRESHOLD DECAY AUTOMATION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3306
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.threshold_decay_automation.lifecycle_and_statusflow.rule
component: threshold-decay-automation-lifecycle-and-statusflow-rule


# DRIFT THRESHOLD TUNING PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# DELEGATION TRUST DECAY PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# AUDIT ESCALATION AUTOMATION PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# DRIFT THRESHOLD TUNING SESSION STATUS SET

- opened
- tuning
- completed
- rolled_back
- archived


# TRUST DECAY EVALUATION CASE STATUS SET

- opened
- decaying
- decided
- rejected
- archived


# AUDIT ESCALATION AUTOMATION CASE STATUS SET

- opened
- automating
- completed
- rejected
- archived


# AUDIT ESCALATION SUMMARY STATUS SET

- drafted
- published
- superseded
- archived

