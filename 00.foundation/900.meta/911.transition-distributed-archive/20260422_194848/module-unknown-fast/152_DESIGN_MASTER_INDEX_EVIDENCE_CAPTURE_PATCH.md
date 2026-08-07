# ============================================================
# DESIGN MASTER INDEX EVIDENCE CAPTURE PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text needed to integrate
the ERP evidence capture set into DESIGN_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
DESIGN_MASTER_INDEX.md should explicitly expose
the ERP evidence capture entrypoint documents,
so that design readers can move from
structural reconciliation
to operational confirmation work.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
ERP Evidence Capture Set

recommended_addition_body:
The ERP evidence capture set is the operational confirmation layer for:
- runtime write-path authority
- public-vs-domain header write-path authority
- settlement and AR/AP evidence hardening
- approval_request-like subfamily evidence hardening

recommended_entry_files:
- 150_ERP_EVIDENCE_CAPTURE_SET_INDEX.md
- 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md

recommended_meaning:
Use this set when reviewing:
- actual write paths
- actual sync/mirror behavior
- actual projection/source-of-truth boundaries
- evidence-backed hardening of provisional reconciliation decisions

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Insert after the ERP reconciliation set integration section if possible.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
This patch should be applied
so that DESIGN_MASTER_INDEX.md becomes
a true navigation entry to ERP evidence-capture work.
