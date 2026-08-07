# ============================================================
# ERP RECONCILIATION ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the ERP reconciliation document set
should be navigated from the root level.

# ============================================================
# 1. ROOT ENTRY FILES
# ============================================================

root_entry_files:
- 124_ERP_DEEP_REVIEW_SET_INDEX.md
- 125_ERP_DEEP_REVIEW_SET_OVERVIEW.md
- 126_ERP_RECONCILIATION_ROADMAP.md
- 127_ERP_RECONCILIATION_CURRENT_STATE.md
- 128_ERP_RECONCILIATION_NEXT_ACTIONS.md
- 129_ERP_RECONCILIATION_DECISION_LOG_SUMMARY.md

# ============================================================
# 2. NAVIGATION ROLE
# ============================================================

navigation_role:
These files are the root bridge between:
- common canonical design
- exact contracts
- real schema/table reconciliation
- ongoing evidence-based review work

# ============================================================
# 3. REQUIRED ROOT LINKS
# ============================================================

required_root_links:
- DESIGN_MASTER_INDEX.md -> reconciliation set
- ERP_SYSTEM_MASTER_INDEX.md -> reconciliation set
- 000_COMMON_DESIGN_INDEX.md -> reconciliation set
- 004.mapping-and-normalization/000_MAPPING_AND_NORMALIZATION_INDEX.md -> deep review corpus

# ============================================================
# 4. READING ORDER
# ============================================================

recommended_reading_order:
1. 125_ERP_DEEP_REVIEW_SET_OVERVIEW.md
2. 126_ERP_RECONCILIATION_ROADMAP.md
3. 127_ERP_RECONCILIATION_CURRENT_STATE.md
4. 129_ERP_RECONCILIATION_DECISION_LOG_SUMMARY.md
5. 124_ERP_DEEP_REVIEW_SET_INDEX.md
6. detailed documents inside 004.mapping-and-normalization

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The reconciliation set must be root-navigable,
because it is now a major part of ERP design understanding,
not a side note.
