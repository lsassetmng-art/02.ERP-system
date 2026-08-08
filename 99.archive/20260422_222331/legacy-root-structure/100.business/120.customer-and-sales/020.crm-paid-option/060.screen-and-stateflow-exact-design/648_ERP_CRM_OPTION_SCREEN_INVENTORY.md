# ============================================================
# ERP CRM OPTION SCREEN INVENTORY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-648
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.screen_inventory
component: crm-option-screen-inventory


# PRIMARY SCREEN SET

Recommended first screen set:

- crm_account_list_screen
- crm_account_detail_screen
- crm_account_edit_screen
- crm_contact_list_screen
- crm_contact_edit_screen
- crm_interaction_timeline_screen
- crm_interaction_create_screen
- crm_inquiry_list_screen
- crm_inquiry_detail_screen
- crm_inquiry_write_screen
- crm_segment_assignment_screen
- crm_lifecycle_transition_screen
- crm_owner_reassignment_screen
- crm_merge_resolution_screen
- crm_archive_confirmation_screen
- crm_option_disabled_screen
- crm_option_suspended_screen
- crm_permission_denied_screen


# RULE

This is a logical screen inventory.

Implementation may package some screens differently,
but logical separation must remain visible.

