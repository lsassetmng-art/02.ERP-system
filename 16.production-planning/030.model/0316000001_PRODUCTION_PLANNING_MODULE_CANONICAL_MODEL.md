# ============================================================
# PRODUCTION PLANNING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 16.production-planning

Entities:
- pp_plan_version
- pp_mrp_proposal
- pp_crp_load_plan
- pp_schedule_plan
- pp_release_recommendation

Status canon:
- draft
- simulated
- approved
- released
- superseded

Invariant:
- released recommendation must reference approved plan version
