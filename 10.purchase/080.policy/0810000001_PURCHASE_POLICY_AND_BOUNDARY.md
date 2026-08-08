# ============================================================
# PURCHASE POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 10.purchase

- Procurement owns supplier selection
- Purchase owns purchase order canon
- Inventory owns stock truth
- Warehouse owns receiving task execution
- Purchase order changes after issue require revision trace
- Purchase does not become receipt truth
