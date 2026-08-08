# ============================================================
# COSTING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 18.costing

Entities:
- costing_standard_cost
- costing_actual_cost_capture
- costing_variance
- costing_rollup
- costing_allocation_rule

Status canon:
- draft
- approved
- active
- superseded
- closed

Invariant:
- actual cost captures are append-oriented and source-referenced
- variance must reference standard/planned baseline
