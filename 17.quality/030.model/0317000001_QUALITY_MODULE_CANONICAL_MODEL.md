# ============================================================
# QUALITY MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 17.quality

Entities:
- quality_inspection_lot
- quality_inspection_result
- quality_release_decision
- quality_ncr
- quality_capa

Status canon:
- pending
- in_inspection
- accepted
- rejected
- released
- held
- closed
