# ============================================================
# DESIGN MASTER INDEX RECONCILIATION PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text needed to integrate
the ERP reconciliation document set into DESIGN_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
DESIGN_MASTER_INDEX.md should explicitly expose
the ERP reconciliation entrypoint documents,
so that canonical design readers can reach
the real-schema reconciliation layer directly.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
ERP Reconciliation Set

recommended_addition_body:
The ERP reconciliation set is the bridge between:
- canonical common design
- exact contract design
- real physical schema and real table reality

recommended_entry_files:
- 124_ERP_DEEP_REVIEW_SET_INDEX.md
- 125_ERP_DEEP_REVIEW_SET_OVERVIEW.md
- 126_ERP_RECONCILIATION_ROADMAP.md
- 127_ERP_RECONCILIATION_CURRENT_STATE.md
- 128_ERP_RECONCILIATION_NEXT_ACTIONS.md
- 129_ERP_RECONCILIATION_DECISION_LOG_SUMMARY.md

recommended_meaning:
Use this set when reviewing:
- real schema fragmentation
- duplicate/transitional families
- runtime write-path confirmation
- public-vs-domain mirror review
- contract-to-real-table alignment

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Insert near other ERP-wide root-level navigation entries,
after the common design set and before deep domain-only navigation if possible.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
This patch should be applied
so that DESIGN_MASTER_INDEX.md becomes
a true navigation entry to ERP reconciliation work.
