# ============================================================
# ERP SYSTEM MASTER INDEX EVIDENCE CAPTURE PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text needed to integrate
the ERP evidence capture set into ERP_SYSTEM_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
ERP_SYSTEM_MASTER_INDEX.md should expose
the evidence capture entrypoint documents
as root-level navigation for operational confirmation work.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
Evidence Capture Set

recommended_addition_body:
The evidence capture set contains ERP-wide documents for:
- runtime write-path confirmation
- public-vs-domain header write-path confirmation
- settlement and AR/AP evidence hardening
- approval_request-like subfamily evidence hardening

recommended_entry_files:
- 150_ERP_EVIDENCE_CAPTURE_SET_INDEX.md
- 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md

recommended_link_target_inside_reconciliation:
- 126_ERP_RECONCILIATION_ROADMAP.md
- 127_ERP_RECONCILIATION_CURRENT_STATE.md
- 128_ERP_RECONCILIATION_NEXT_ACTIONS.md

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Place after the reconciliation set integration section if possible.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
This patch should be applied
so that ERP_SYSTEM_MASTER_INDEX.md formally includes
the ERP evidence capture navigation entrypoint.
