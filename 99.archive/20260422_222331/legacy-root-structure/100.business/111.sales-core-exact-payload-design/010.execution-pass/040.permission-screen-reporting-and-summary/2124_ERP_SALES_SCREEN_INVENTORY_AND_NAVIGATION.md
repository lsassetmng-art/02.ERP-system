# ============================================================
# ERP SALES SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2124
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.screen_inventory_and_navigation
component: sales-screen-inventory-and-navigation


# PRIMARY SCREENS

- sales_quote_screen
- sales_order_screen
- sales_fulfillment_instruction_screen
- sales_invoice_request_screen
- sales_correction_case_screen
- sales_permission_denied_screen

# PRIMARY ENTRY FLOW

sales entry
-> quote / order
-> fulfillment / invoice request
-> correction

