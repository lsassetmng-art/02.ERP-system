# ============================================================
# ERP ACCOUNTING SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1441
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.screen_inventory_and_navigation
component: accounting-screen-inventory-and-navigation


# PRIMARY SCREENS

- accounting_journal_entry_screen
- accounting_ledger_posting_screen
- accounting_correction_request_screen
- accounting_reversal_entry_screen
- accounting_close_cycle_screen
- accounting_permission_denied_screen

# PRIMARY ENTRY FLOW

accounting entry
-> journal / ledger
-> correction / reversal
-> close-cycle subflows

