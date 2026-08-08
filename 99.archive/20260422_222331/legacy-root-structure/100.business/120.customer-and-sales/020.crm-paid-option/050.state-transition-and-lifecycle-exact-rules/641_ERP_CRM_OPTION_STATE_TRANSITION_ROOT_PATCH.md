# ============================================================
# ERP CRM OPTION STATE TRANSITION ROOT PATCH
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-641
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.state_transition.root_patch
component: crm-option-state-transition-root-patch


# PATCH INTENT

Attach this state-transition exactness set under:

- 100.business/120.customer-and-sales/020.crm-paid-option/050.state-transition-and-lifecycle-exact-rules

This set deepens the CRM paid option line from
contract exactness to mutation governance exactness.

