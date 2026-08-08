# ============================================================
# ERP ACCOUNTING SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2221
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.screen_inventory_and_navigation
component: accounting-screen-inventory-and-navigation


# PRIMARY SCREENS

- accounting_document_draft_screen
- journal_batch_screen
- receivable_payable_position_screen
- close_cycle_screen
- accounting_correction_case_screen
- accounting_permission_denied_screen

# PRIMARY ENTRY FLOW

accounting entry
-> document draft / journal batch
-> receivable-payable / close cycle
-> correction

