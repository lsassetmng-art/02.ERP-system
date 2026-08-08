# ============================================================
# WAREHOUSE MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 13.warehouse

Entities:
- warehouse_task
- warehouse_receiving_execution
- warehouse_putaway_execution
- warehouse_picking_execution
- warehouse_packing_execution
- warehouse_shipping_execution
- warehouse_exception

Status canon:
- pending
- assigned
- in_progress
- completed
- short
- cancelled
