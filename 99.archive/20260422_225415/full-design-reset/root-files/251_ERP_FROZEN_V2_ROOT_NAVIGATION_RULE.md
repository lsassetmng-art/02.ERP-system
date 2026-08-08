# ============================================================
# ERP FROZEN V2 ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the frozen v2 preparation set
should be navigated from the root level.

root_entry_files:
- 241_ERP_FROZEN_V1_DEFERRED_NEXT_CYCLE_NOTE.md
- 242_ERP_FROZEN_V2_PREPARATION_ROADMAP.md
- 243_ERP_DEFERRED_AUTHORITY_REVIEW_ORDER.md
- 244_ERP_DEFERRED_AUTHORITY_EVIDENCE_BACKLOG.md
- 245_ERP_FROZEN_V2_ENTRY_CONDITIONS.md
- 246_ERP_POST_V1_PROMOTION_SUMMARY.md
- 247_ERP_FROZEN_V2_NAVIGATION_NOTE.md
- 248_ERP_FROZEN_V2_ROOT_PATCH.md

navigation_role:
These files are the next-cycle preparation checkpoint
after frozen authority registry v1.

required_root_links:
- DESIGN_MASTER_INDEX.md -> frozen v2 preparation set
- ERP_SYSTEM_MASTER_INDEX.md -> frozen v2 preparation set
- 235_ERP_FROZEN_AUTHORITY_REGISTRY_V1_SUMMARY.md -> next-cycle bridge
- 246_ERP_POST_V1_PROMOTION_SUMMARY.md -> v2 preparation entry
- 242_ERP_FROZEN_V2_PREPARATION_ROADMAP.md -> v2 roadmap entry

recommended_reading_order:
1. 246_ERP_POST_V1_PROMOTION_SUMMARY.md
2. 242_ERP_FROZEN_V2_PREPARATION_ROADMAP.md
3. 243_ERP_DEFERRED_AUTHORITY_REVIEW_ORDER.md
4. 244_ERP_DEFERRED_AUTHORITY_EVIDENCE_BACKLOG.md
5. 245_ERP_FROZEN_V2_ENTRY_CONDITIONS.md
6. 247_ERP_FROZEN_V2_NAVIGATION_NOTE.md

conclusion:
Frozen v2 preparation must be root-navigable,
because it defines the next-cycle work frontier after v1.
