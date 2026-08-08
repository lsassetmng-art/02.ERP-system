# ============================================================
# SOP CONSENSUS SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Access scopes
- sop_consensus.read
- sop_consensus.version.create
- sop_consensus.agree
- sop_consensus.freeze
- sop_consensus.send_to_production_planning
- sop_consensus.admin.correct

## 2. Sensitive surfaces
- executive freeze decisions
- capacity constraint notes
- inventory risk assumptions
- unresolved issue and accepted-risk rationale

## 3. Audit requirements
- consensus version creation logged
- agreement changes logged
- freeze action logged
- production-planning send logged
