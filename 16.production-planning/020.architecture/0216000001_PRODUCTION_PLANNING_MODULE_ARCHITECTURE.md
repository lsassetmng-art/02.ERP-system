# ============================================================
# PRODUCTION PLANNING MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 16.production-planning

Components:
- Demand/Supply Planning Service
- MRP Proposal Service
- CRP Load Planning Service
- Detailed Scheduling Service
- Release Recommendation Service

Outbound surfaces:
- production release recommendation to Manufacturing
- material plan reference to Purchase/Inventory
- capacity load reference to dashboards
