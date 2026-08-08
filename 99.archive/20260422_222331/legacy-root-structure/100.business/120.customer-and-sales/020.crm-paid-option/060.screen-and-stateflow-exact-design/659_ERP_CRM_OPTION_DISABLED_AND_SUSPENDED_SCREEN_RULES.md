# ============================================================
# ERP CRM OPTION DISABLED AND SUSPENDED SCREEN RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-659
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.disabled_and_suspended_screen.rules
component: crm-option-disabled-and-suspended-screen-rules


# OPTION DISABLED SCREEN

Recommended meanings:
- CRM not contracted or not enabled
- rich CRM operations unavailable
- ERP core may still continue through core customer reference


# OPTION SUSPENDED SCREEN

Recommended meanings:
- CRM contract or usage temporarily blocked
- writes generally unavailable
- reads may be policy-restricted


# RULE

disabled and suspended must not be visually or logically conflated.

Their user guidance and allowed next actions differ.

