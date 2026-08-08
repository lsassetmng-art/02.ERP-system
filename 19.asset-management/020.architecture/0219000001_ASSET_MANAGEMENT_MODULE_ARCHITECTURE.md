# ============================================================
# ASSET MANAGEMENT MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 19.asset-management

Components:
- Equipment Register Service
- Maintenance Planning Service
- Maintenance Request Service
- Utilization Tracking Service
- Downtime / Completion Service

Outbound surfaces:
- equipment availability context to Manufacturing/Planning
- maintenance cost reference to Costing
- asset accounting reference to Fixed Assets if needed
