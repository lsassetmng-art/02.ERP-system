# ============================================================
# ERP FROZEN REGISTRY V2 ACTUAL ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how frozen authority registry v2 actual set
should be navigated from the root level.

root_entry_files:
- 318_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_OVERVIEW.md
- 319_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_RUNTIME.md
- 320_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_APPROVAL.md
- 321_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_SETTLEMENT.md
- 322_ERP_FROZEN_AUTHORITY_REGISTRY_V2_LAYERED_SURFACES.md
- 323_ERP_FROZEN_AUTHORITY_REGISTRY_V2_WORKING_AND_DEFERRED.md
- 324_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_SUMMARY.md
- 325_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_NAVIGATION_NOTE.md
- 326_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_ROOT_PATCH.md

navigation_role:
These files are the concrete v2 actual freeze-expansion result layer
after draft and freeze decisions.

required_root_links:
- DESIGN_MASTER_INDEX.md -> frozen authority registry v2 actual set
- ERP_SYSTEM_MASTER_INDEX.md -> frozen authority registry v2 actual set
- 324_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_SUMMARY.md -> main v2 actual summary entry
- 317_ERP_V2_FROZEN_DECISION_SUMMARY.md -> v2 decision bridge
- 306_ERP_FROZEN_AUTHORITY_REGISTRY_V2_SUMMARY.md -> v2 draft bridge

recommended_reading_order:
1. 324_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_SUMMARY.md
2. 318_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_OVERVIEW.md
3. 319_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_RUNTIME.md
4. 320_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_APPROVAL.md
5. 321_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_SETTLEMENT.md
6. 322_ERP_FROZEN_AUTHORITY_REGISTRY_V2_LAYERED_SURFACES.md
7. 323_ERP_FROZEN_AUTHORITY_REGISTRY_V2_WORKING_AND_DEFERRED.md
8. 325_ERP_FROZEN_AUTHORITY_REGISTRY_V2_ACTUAL_NAVIGATION_NOTE.md

conclusion:
Frozen authority registry v2 actual set must be root-navigable,
because it is now the current concrete post-v1 freeze result.
