# ============================================================
# ERP PURCHASE SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2156
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.screen_inventory_and_navigation
component: purchase-screen-inventory-and-navigation


# PRIMARY SCREENS

- purchase_request_screen
- purchase_order_screen
- receipt_expectation_screen
- supplier_invoice_intake_screen
- purchase_correction_case_screen
- purchase_permission_denied_screen

# PRIMARY ENTRY FLOW

purchase entry
-> request / order
-> receipt expectation / supplier invoice intake
-> correction

