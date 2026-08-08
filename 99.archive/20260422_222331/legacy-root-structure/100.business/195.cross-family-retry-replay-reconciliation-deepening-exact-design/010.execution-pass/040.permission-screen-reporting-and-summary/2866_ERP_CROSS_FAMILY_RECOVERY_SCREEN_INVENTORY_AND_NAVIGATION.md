# ============================================================
# ERP CROSS FAMILY RECOVERY SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2866
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_recovery.screen_inventory_and_navigation
component: cross-family-recovery-screen-inventory-and-navigation


# PRIMARY SCREENS

- retry_queue_screen
- replay_audit_screen
- reconciliation_ledger_screen
- dead_letter_queue_screen
- recovery_detail_screen
- cross_family_recovery_permission_denied_screen

# PRIMARY ENTRY FLOW

cross-family recovery entry
-> retry / replay
-> reconciliation / dead letter
-> recovery detail / audit

