# ============================================================
# ERP GOVERNANCE SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1623
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.screen_inventory_and_navigation
component: governance-screen-inventory-and-navigation


# PRIMARY SCREENS

- governance_control_policy_screen
- governance_control_requirement_screen
- governance_exception_case_screen
- governance_override_approval_screen
- governance_signoff_record_screen
- governance_permission_denied_screen

# PRIMARY ENTRY FLOW

governance entry
-> policy / requirement
-> exception / override
-> signoff subflows

