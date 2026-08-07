# ============================================================
# ERP AUTHORITY REGISTRY ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the ERP authority registry draft
should be navigated from the root level.

# ============================================================
# 1. ROOT ENTRY FILES
# ============================================================

root_entry_files:
- 172_ERP_AUTHORITY_REGISTRY_DRAFT_OVERVIEW.md
- 173_ERP_AUTHORITY_REGISTRY_DRAFT_RUNTIME.md
- 174_ERP_AUTHORITY_REGISTRY_DRAFT_HEADERS.md
- 175_ERP_AUTHORITY_REGISTRY_DRAFT_SETTLEMENT_AR_AP_APPROVAL.md
- 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md

# ============================================================
# 2. NAVIGATION ROLE
# ============================================================

navigation_role:
These files are the current working authority checkpoint
between:
- evidence-based hardening
and
- final frozen authority decisions

# ============================================================
# 3. REQUIRED ROOT LINKS
# ============================================================

required_root_links:
- DESIGN_MASTER_INDEX.md -> authority registry draft
- ERP_SYSTEM_MASTER_INDEX.md -> authority registry draft
- 126_ERP_RECONCILIATION_ROADMAP.md -> authority registry checkpoint
- 127_ERP_RECONCILIATION_CURRENT_STATE.md -> authority registry checkpoint
- 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md -> authority registry output

# ============================================================
# 4. READING ORDER
# ============================================================

recommended_reading_order:
1. 172_ERP_AUTHORITY_REGISTRY_DRAFT_OVERVIEW.md
2. 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md
3. 173_ERP_AUTHORITY_REGISTRY_DRAFT_RUNTIME.md
4. 174_ERP_AUTHORITY_REGISTRY_DRAFT_HEADERS.md
5. 175_ERP_AUTHORITY_REGISTRY_DRAFT_SETTLEMENT_AR_AP_APPROVAL.md

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The authority registry draft must be root-navigable,
because it is now the main working authority checkpoint in ERP reconciliation.
