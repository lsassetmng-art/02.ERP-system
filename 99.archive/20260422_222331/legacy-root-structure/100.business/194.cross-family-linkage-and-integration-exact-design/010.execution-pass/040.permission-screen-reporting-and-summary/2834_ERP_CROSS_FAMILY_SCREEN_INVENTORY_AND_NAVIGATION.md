# ============================================================
# ERP CROSS FAMILY SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2834
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family.screen_inventory_and_navigation
component: cross-family-screen-inventory-and-navigation


# PRIMARY SCREENS

- handoff_contract_list_screen
- handoff_contract_detail_screen
- handoff_failure_queue_screen
- handoff_retry_queue_screen
- replay_audit_viewer_screen
- cross_family_permission_denied_screen

# PRIMARY ENTRY FLOW

cross-family entry
-> contract list / detail
-> failure / retry
-> replay / audit

