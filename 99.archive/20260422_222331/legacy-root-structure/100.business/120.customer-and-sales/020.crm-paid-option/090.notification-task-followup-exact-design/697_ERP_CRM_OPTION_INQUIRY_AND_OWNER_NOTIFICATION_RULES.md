# ============================================================
# ERP CRM OPTION INQUIRY AND OWNER NOTIFICATION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-697
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.inquiry_and_owner_notification.rules
component: crm-option-inquiry-and-owner-notification-rules


# PRIMARY RULES

## inquiry_opened
Notify owner or assigned queue when inquiry is created.

## inquiry_reassigned
Notify next owner and preserve prior ownership trace.

## inquiry_escalated
Notify escalation reviewer or controlled escalation path.

## response_sla_risk
Notify before SLA breach window when policy requires.

## followup_overdue
Notify responsible owner and optionally manager path.

## lifecycle_changed
Notify owner when lifecycle transition has downstream meaning.


# CONSTRAINTS

Do not notify users who cannot read the underlying object.

Do not emit owner notification without exact owner resolution.

