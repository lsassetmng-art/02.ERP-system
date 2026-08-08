# ============================================================
# ERP CRM OPTION INTEGRATION HANDOFF CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-704
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.integration_handoff.current_state
component: crm-option-integration-handoff-current-state


# ABSTRACT

Defines the current state for the first exact integration
and handoff pass for the CRM paid option.

This pass fixes:
- ERP core customer reference linkage
- SFA-facing handoff boundary
- estimate/order/billing reference boundary
- option-disabled safe behavior


# GOAL

The goal is to connect CRM outward without making it
a hidden mandatory dependency for ERP core.

