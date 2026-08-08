# ============================================================
# QUALITY MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 17.quality

Components:
- Inspection Lot Service
- Inspection Result Service
- NCR Service
- CAPA Service
- Quality Release Decision Service

Outbound surfaces:
- release/hold decision to Manufacturing, Inventory, Warehouse
- quality variance reference to Costing
