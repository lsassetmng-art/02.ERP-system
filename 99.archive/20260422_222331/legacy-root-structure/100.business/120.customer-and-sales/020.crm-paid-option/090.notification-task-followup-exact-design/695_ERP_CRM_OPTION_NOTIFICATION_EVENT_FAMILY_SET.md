# ============================================================
# ERP CRM OPTION NOTIFICATION EVENT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-695
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.notification_event_family_set
component: crm-option-notification-event-family-set


# RECOMMENDED EVENT FAMILIES

- followup_due_soon
- followup_overdue
- inquiry_opened
- inquiry_reassigned
- inquiry_escalated
- inquiry_response_sla_risk
- owner_reassigned
- lifecycle_changed
- segment_changed
- merge_completed
- archive_completed


# RULE

A notification event is not the same thing as
the underlying CRM object state.

It is an event surface derived from object state,
time condition, or controlled action result.

