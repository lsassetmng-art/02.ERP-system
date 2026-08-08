# ============================================================
# INVENTORY MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 12.inventory

Entities:
- inventory_balance
- inventory_movement
- inventory_reservation
- inventory_adjustment
- inventory_expected_event

Key fields:
inventory_balance:
- inventory_balance_id
- item_id
- warehouse_id
- location_id nullable
- lot_id nullable
- serial_id nullable
- on_hand_quantity
- reserved_quantity
- available_quantity

Invariant:
- available = on_hand - reserved
- movements are append-oriented
- adjustment requires reason trace
