# ============================================================
# ERP EPM OBJECTIVE LIFECYCLE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-856
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.objective_lifecycle.rules
component: epm-objective-lifecycle-rules


# OBJECTIVE STATUS SET

- draft
- active
- on_hold
- completed
- canceled
- archived


# ALLOWED TRANSITIONS

- draft -> active
- active -> on_hold
- active -> completed
- active -> canceled
- on_hold -> active
- completed -> archived
- canceled -> archived


# RULE

Archived is not active completion.
Completed/canceled must remain historically distinguishable.

