# ============================================================
# ERP PRE FREEZE ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the pre-freeze layer
should be navigated from the root level.

root_entry_files:
- 208_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_OVERVIEW.md
- 209_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_RUNTIME_SUPPORT_AND_HISTORY.md
- 210_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_HEADERS_AND_PROJECTIONS.md
- 211_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_ACCOUNTING_CORE.md
- 212_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_SUMMARY.md
- 213_ERP_PRE_FREEZE_LAYER_NAVIGATION_NOTE.md
- 214_ERP_PRE_FREEZE_LAYER_ROOT_PATCH.md

navigation_role:
These files are the narrowed candidate checkpoint between:
- authority promotion phase
and
- future frozen authority registry

required_root_links:
- DESIGN_MASTER_INDEX.md -> pre-freeze layer
- ERP_SYSTEM_MASTER_INDEX.md -> pre-freeze layer
- 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md -> pre-freeze layer
- 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md -> pre-freeze layer
- 212_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_SUMMARY.md -> pre-freeze summary entry

recommended_reading_order:
1. 212_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_SUMMARY.md
2. 208_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_OVERVIEW.md
3. 209_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_RUNTIME_SUPPORT_AND_HISTORY.md
4. 210_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_HEADERS_AND_PROJECTIONS.md
5. 211_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_ACCOUNTING_CORE.md
6. 213_ERP_PRE_FREEZE_LAYER_NAVIGATION_NOTE.md

conclusion:
The pre-freeze layer must be root-navigable,
because it is the current narrowed candidate checkpoint before freeze.
