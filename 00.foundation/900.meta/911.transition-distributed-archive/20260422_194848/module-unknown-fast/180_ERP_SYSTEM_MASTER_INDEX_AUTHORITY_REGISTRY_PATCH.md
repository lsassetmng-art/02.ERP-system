# ============================================================
# ERP SYSTEM MASTER INDEX AUTHORITY REGISTRY PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text needed to integrate
the ERP authority registry draft into ERP_SYSTEM_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
ERP_SYSTEM_MASTER_INDEX.md should expose
the authority registry draft
as a root-level navigation checkpoint after evidence capture.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
Authority Registry Draft

recommended_addition_body:
The authority registry draft contains the current working map for:
- runtime authority
- header/document authority
- settlement authority
- AR/AP projection and unresolved base-truth questions
- approval_request-like subfamily authority

recommended_entry_files:
- 172_ERP_AUTHORITY_REGISTRY_DRAFT_OVERVIEW.md
- 173_ERP_AUTHORITY_REGISTRY_DRAFT_RUNTIME.md
- 174_ERP_AUTHORITY_REGISTRY_DRAFT_HEADERS.md
- 175_ERP_AUTHORITY_REGISTRY_DRAFT_SETTLEMENT_AR_AP_APPROVAL.md
- 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md

recommended_link_targets:
- 126_ERP_RECONCILIATION_ROADMAP.md
- 127_ERP_RECONCILIATION_CURRENT_STATE.md
- 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Place after the evidence capture set integration section if possible.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
This patch should be applied
so that ERP_SYSTEM_MASTER_INDEX.md formally includes
the working authority checkpoint.
