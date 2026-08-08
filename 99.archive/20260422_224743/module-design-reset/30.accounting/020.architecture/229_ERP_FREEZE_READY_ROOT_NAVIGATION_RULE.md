# ============================================================
# ERP FREEZE READY ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the freeze-ready verification set
should be navigated from the root level.

root_entry_files:
- 218_ERP_FREEZE_READY_VERIFICATION_SET_OVERVIEW.md
- 219_ERP_RUNTIME_FINAL_VERIFICATION_PLAN.md
- 220_ERP_SETTLEMENT_AND_AR_AP_FINAL_VERIFICATION_PLAN.md
- 221_ERP_APPROVAL_FINAL_VERIFICATION_PLAN.md
- 222_ERP_FREEZE_READY_CANDIDATE_AND_HOLD_SPLIT.md
- 223_ERP_FROZEN_AUTHORITY_REGISTRY_V1_TEMPLATE.md
- 224_ERP_FROZEN_AUTHORITY_REGISTRY_V1_PREPARATION_SUMMARY.md
- 225_ERP_FREEZE_READY_NAVIGATION_NOTE.md
- 226_ERP_FREEZE_READY_ROOT_PATCH.md

navigation_role:
These files are the final targeted verification and assembly-preparation checkpoint between:
- pre-freeze narrowed candidate layer
and
- frozen authority registry v1

required_root_links:
- DESIGN_MASTER_INDEX.md -> freeze-ready verification set
- ERP_SYSTEM_MASTER_INDEX.md -> freeze-ready verification set
- 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md -> freeze-ready layer
- 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md -> freeze-ready layer
- 212_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_SUMMARY.md -> freeze-ready bridge
- 224_ERP_FROZEN_AUTHORITY_REGISTRY_V1_PREPARATION_SUMMARY.md -> v1 preparation summary entry

recommended_reading_order:
1. 224_ERP_FROZEN_AUTHORITY_REGISTRY_V1_PREPARATION_SUMMARY.md
2. 218_ERP_FREEZE_READY_VERIFICATION_SET_OVERVIEW.md
3. 222_ERP_FREEZE_READY_CANDIDATE_AND_HOLD_SPLIT.md
4. 219_ERP_RUNTIME_FINAL_VERIFICATION_PLAN.md
5. 220_ERP_SETTLEMENT_AND_AR_AP_FINAL_VERIFICATION_PLAN.md
6. 221_ERP_APPROVAL_FINAL_VERIFICATION_PLAN.md
7. 223_ERP_FROZEN_AUTHORITY_REGISTRY_V1_TEMPLATE.md
8. 225_ERP_FREEZE_READY_NAVIGATION_NOTE.md

conclusion:
The freeze-ready verification set must be root-navigable,
because it is the last major checkpoint before frozen authority registry v1.
