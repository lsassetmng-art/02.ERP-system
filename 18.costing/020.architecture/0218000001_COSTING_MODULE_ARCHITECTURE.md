# ============================================================
# COSTING MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 18.costing

Components:
- Standard Cost Service
- Actual Cost Capture Service
- Variance Analysis Service
- Cost Rollup Service
- Accounting Reference Bridge Service

Inbound surfaces:
- purchase price references
- manufacturing actual references
- quality variance references
- asset utilization/depreciation references as needed

Rule:
Costing aggregates cost truth from operational references but does not own execution canon.
