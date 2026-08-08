# ============================================================
# ERP CRM OPTION NOTIFICATION TASK FOLLOWUP CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-694
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.notification_task_followup.current_state
component: crm-option-notification-task-followup-current-state


# ABSTRACT

Defines the current state for the first exact
notification, task, and follow-up pass for the CRM paid option.

This pass fixes:
- notification event families
- follow-up task treatment
- inquiry / owner / lifecycle notifications
- task stateflow boundaries


# GOAL

The goal is to prevent vague reminder behavior.

Notifications and follow-up tasks must be:
- object-linked
- state-aware
- permission-aware
- non-silent
- distinguishable from source CRM objects

