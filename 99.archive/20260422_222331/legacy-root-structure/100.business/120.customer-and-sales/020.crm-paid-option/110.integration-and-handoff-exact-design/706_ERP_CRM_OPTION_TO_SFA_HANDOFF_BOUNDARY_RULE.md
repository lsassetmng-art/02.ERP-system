# ============================================================
# ERP CRM OPTION TO SFA HANDOFF BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-706
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option_to_sfa.handoff_boundary_rule
component: crm-option-to-sfa-handoff-boundary-rule


# RULE

CRM and SFA remain distinct paid option modules or
distinct functional layers even when both are enabled.


# CRM SIDE

CRM owns:
- customer context
- relationship continuity
- inquiry and interaction continuity
- customer segmentation
- customer lifecycle interpretation


# SFA SIDE

SFA should own:
- lead / opportunity execution
- stage progression
- sales action planning
- forecast treatment


# HANDOFF RULE

SFA may consume CRM context, but CRM customer account
must not be redefined as merely an opportunity container.

