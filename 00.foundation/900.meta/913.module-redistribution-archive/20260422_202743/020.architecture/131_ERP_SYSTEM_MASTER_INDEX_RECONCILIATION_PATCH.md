# ============================================================
# ERP SYSTEM MASTER INDEX RECONCILIATION PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text needed to integrate
the ERP reconciliation document set into ERP_SYSTEM_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
ERP_SYSTEM_MASTER_INDEX.md should expose
the reconciliation entrypoint documents
as root-level navigation for canonical-to-real alignment work.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
Reconciliation Set

recommended_addition_body:
The reconciliation set contains ERP-wide documents for:
- real schema inventory
- mixed schema review
- duplicate/transitional review
- contract-to-real-table alignment
- runtime/header confirmation work
- roadmap and next actions

recommended_entry_files:
- 124_ERP_DEEP_REVIEW_SET_INDEX.md
- 125_ERP_DEEP_REVIEW_SET_OVERVIEW.md
- 126_ERP_RECONCILIATION_ROADMAP.md
- 127_ERP_RECONCILIATION_CURRENT_STATE.md
- 128_ERP_RECONCILIATION_NEXT_ACTIONS.md
- 129_ERP_RECONCILIATION_DECISION_LOG_SUMMARY.md

recommended_link_target_inside_common_design:
- 004.mapping-and-normalization/000_MAPPING_AND_NORMALIZATION_INDEX.md

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Place near the top-level shared/root navigation section,
together with common design navigation.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
This patch should be applied
so that ERP_SYSTEM_MASTER_INDEX.md formally includes
the ERP reconciliation navigation entrypoint.
