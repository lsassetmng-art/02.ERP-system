# ============================================================
# ERP CRM OPTION FOLLOWUP TASK OBJECT AND STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-696
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.followup_task.object_and_stateflow
component: crm-option-followup-task-object-and-stateflow


# INTERPRETATION

Follow-up should be treated as a governed task-like surface,
not merely a visual badge.


# REPRESENTATIVE TASK FIELDS

- followup_task_id
- related_object_type
- related_object_id
- owner_user_id
- due_at
- followup_status_code
- followup_reason_code
- created_at
- created_by
- completed_at
- completed_by


# RECOMMENDED STATUS SET

- open
- due_soon
- overdue
- completed
- canceled
- blocked


# RULE

Follow-up task completion must not rewrite the source
interaction or inquiry object itself as if the reminder
never existed.

