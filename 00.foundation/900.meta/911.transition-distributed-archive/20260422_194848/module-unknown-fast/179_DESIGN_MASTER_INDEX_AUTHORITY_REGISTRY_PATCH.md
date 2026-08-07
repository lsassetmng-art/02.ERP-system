# ============================================================
# DESIGN MASTER INDEX AUTHORITY REGISTRY PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text needed to integrate
the ERP authority registry draft into DESIGN_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
DESIGN_MASTER_INDEX.md should explicitly expose
the ERP authority registry draft,
so readers can move from reconciliation and evidence capture
to the current consolidated authority map.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
ERP Authority Registry Draft

recommended_addition_body:
The ERP authority registry draft is the current consolidated working map for:
- source-of-truth candidates
- write-authority candidates
- projection/view families
- support/history families
- unresolved authority questions

recommended_entry_files:
- 172_ERP_AUTHORITY_REGISTRY_DRAFT_OVERVIEW.md
- 173_ERP_AUTHORITY_REGISTRY_DRAFT_RUNTIME.md
- 174_ERP_AUTHORITY_REGISTRY_DRAFT_HEADERS.md
- 175_ERP_AUTHORITY_REGISTRY_DRAFT_SETTLEMENT_AR_AP_APPROVAL.md
- 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md

recommended_meaning:
Use this set after:
- deep reconciliation review
- evidence-capture first-pass hardening

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Insert after the ERP evidence capture set integration section if possible.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
This patch should be applied
so that DESIGN_MASTER_INDEX.md becomes
a true navigation entry to the working authority map.
