# ============================================================
# ERP FROZEN REGISTRY V1 ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how frozen authority registry v1
should be navigated from the root level.

root_entry_files:
- 230_ERP_FROZEN_AUTHORITY_REGISTRY_V1_OVERVIEW.md
- 231_ERP_FROZEN_AUTHORITY_REGISTRY_V1_RUNTIME_SUPPORT_AND_HISTORY.md
- 232_ERP_FROZEN_AUTHORITY_REGISTRY_V1_HEADERS_AND_PROJECTIONS.md
- 233_ERP_FROZEN_AUTHORITY_REGISTRY_V1_ACCOUNTING_CORE.md
- 234_ERP_FROZEN_AUTHORITY_REGISTRY_V1_DEFERRED_ENTRIES.md
- 235_ERP_FROZEN_AUTHORITY_REGISTRY_V1_SUMMARY.md
- 236_ERP_FROZEN_AUTHORITY_REGISTRY_V1_NAVIGATION_NOTE.md
- 237_ERP_FROZEN_AUTHORITY_REGISTRY_V1_ROOT_PATCH.md

navigation_role:
These files are the first concrete frozen authority output layer
after freeze-ready verification and v1 preparation.

required_root_links:
- DESIGN_MASTER_INDEX.md -> frozen authority registry v1
- ERP_SYSTEM_MASTER_INDEX.md -> frozen authority registry v1
- 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md -> frozen registry v1 output
- 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md -> frozen registry v1 output
- 224_ERP_FROZEN_AUTHORITY_REGISTRY_V1_PREPARATION_SUMMARY.md -> v1 output
- 235_ERP_FROZEN_AUTHORITY_REGISTRY_V1_SUMMARY.md -> main frozen summary entry

recommended_reading_order:
1. 235_ERP_FROZEN_AUTHORITY_REGISTRY_V1_SUMMARY.md
2. 230_ERP_FROZEN_AUTHORITY_REGISTRY_V1_OVERVIEW.md
3. 233_ERP_FROZEN_AUTHORITY_REGISTRY_V1_ACCOUNTING_CORE.md
4. 231_ERP_FROZEN_AUTHORITY_REGISTRY_V1_RUNTIME_SUPPORT_AND_HISTORY.md
5. 232_ERP_FROZEN_AUTHORITY_REGISTRY_V1_HEADERS_AND_PROJECTIONS.md
6. 234_ERP_FROZEN_AUTHORITY_REGISTRY_V1_DEFERRED_ENTRIES.md
7. 236_ERP_FROZEN_AUTHORITY_REGISTRY_V1_NAVIGATION_NOTE.md

conclusion:
Frozen authority registry v1 must be root-navigable,
because it is now the first actual frozen authority output.
