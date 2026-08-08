# ============================================================
# ERP CRM PAID OPTION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2361
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_paid_option.screen_inventory_and_navigation
component: crm-paid-option-screen-inventory-and-navigation


# PRIMARY SCREENS

- customer_account_screen
- customer_contact_screen
- customer_interaction_case_screen
- customer_segment_assignment_screen
- customer_relationship_health_snapshot_screen
- crm_permission_denied_screen

# PRIMARY ENTRY FLOW

crm entry
-> account / contact
-> interaction / segment
-> relationship health

