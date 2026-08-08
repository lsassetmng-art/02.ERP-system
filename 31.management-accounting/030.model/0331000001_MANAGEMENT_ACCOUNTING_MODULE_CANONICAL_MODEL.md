# ============================================================
# MANAGEMENT ACCOUNTING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 31.management-accounting

Entities:
- mgmt_allocation_rule
- mgmt_cost_center_result
- mgmt_segment_profitability
- mgmt_internal_variance
- mgmt_reporting_snapshot

Invariant:
- managerial snapshots remain reproducible from source references and rules
