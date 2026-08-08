# ============================================================
# LOGISTICS MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 14.logistics

Components:
- Dispatch Service
- Transportation Assignment Service
- Delivery Execution Service
- Route Planning Reference Service
- Exception / Delay Service

Outbound surfaces:
- delivery progress reference to Order Management
- billable/shipment proof reference where applicable
