# ============================================================
# ERP CRM OPTION NAVIGATION MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-649
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.navigation_map
component: crm-option-navigation-map


# PRIMARY ENTRY FLOW

crm option entry
-> account list
-> account detail
-> account subflows


# ACCOUNT SUBFLOWS

account detail
-> contact list / contact write
-> interaction timeline / interaction create
-> inquiry list / inquiry detail / inquiry write
-> segment assignment
-> lifecycle transition
-> owner reassignment
-> merge resolution
-> archive confirmation


# PROTECTED ENTRY FLOWS

If option not enabled:
entry -> crm_option_disabled_screen

If option suspended:
entry -> crm_option_suspended_screen

If permission missing:
target entry -> crm_permission_denied_screen or action-blocked state


# RULE

Navigation must follow capability and state gating first,
not only menu visibility.

