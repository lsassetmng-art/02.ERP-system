# ============================================================
# INVENTORY POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 12.inventory

- Inventory owns quantity truth
- Warehouse posts movement-producing execution events
- Order Management reads availability, not stock canon
- adjustments require audit trail
