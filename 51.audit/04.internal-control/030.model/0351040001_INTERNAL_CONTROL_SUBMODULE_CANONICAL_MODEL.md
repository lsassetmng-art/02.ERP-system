# ============================================================
# INTERNAL CONTROL SUBMODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 51.audit / 04.internal-control

entities:
- internal_control_review_package
- internal_control_item
- internal_control_evaluation
- internal_control_deficiency
- internal_control_remediation
- internal_control_closure

invariant:
- deficiency and closure remain historically visible and source-referenced
