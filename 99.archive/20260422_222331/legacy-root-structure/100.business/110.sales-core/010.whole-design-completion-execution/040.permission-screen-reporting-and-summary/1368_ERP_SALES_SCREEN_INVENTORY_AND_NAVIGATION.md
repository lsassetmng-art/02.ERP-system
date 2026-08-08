# ============================================================
# ERP SALES SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1368
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.screen_inventory_and_navigation
component: sales-screen-inventory-and-navigation


# PRIMARY SCREENS

- sales_quote_screen
- sales_order_screen
- sales_fulfillment_instruction_screen
- sales_billing_instruction_screen
- sales_return_request_screen
- sales_permission_denied_screen

# PRIMARY ENTRY FLOW

sales entry
-> quote
-> order
-> fulfillment / billing
-> return and reversal subflows

