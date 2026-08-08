# ============================================================
# SOP CONSENSUS POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Boundary policy
- 06 owns market demand forecast truth
- 07 owns agreed consensus plan truth
- 16 owns executable production planning truth
- 60 may analyze consensus truth but does not own it

## 2. Freeze policy
- approved_freeze versions are immutable snapshots
- material change after freeze requires new version
- superseded versions remain historically visible

## 3. Issue policy
- unresolved issues must remain traceable
- accepted_risk requires explicit decision record
- open issues do not disappear on freeze

## 4. Handoff policy
- production-planning handoff is payload-based
- accepted_by_production_planning does not transfer ownership of consensus canon
