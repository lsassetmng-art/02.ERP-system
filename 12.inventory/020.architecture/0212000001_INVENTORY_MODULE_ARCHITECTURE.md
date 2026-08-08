# ============================================================
# INVENTORY MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 12.inventory

Components:
- Inventory Balance Service
- Reservation Service
- Movement Posting Service
- Availability Inquiry Service
- Adjustment Service

Main aggregates:
- inventory_balance
- inventory_movement
- inventory_reservation
- inventory_adjustment
- inventory_expected_event

Outbound surfaces:
- availability to Order Management
- receipt/issue reference to Warehouse
- costing/accounting reference payload only
