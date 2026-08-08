# ============================================================
# ERP EVIDENCE CAPTURE ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the ERP evidence capture set
should be navigated from the root level.

# ============================================================
# 1. ROOT ENTRY FILES
# ============================================================

root_entry_files:
- 150_ERP_EVIDENCE_CAPTURE_SET_INDEX.md
- 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md

# ============================================================
# 2. NAVIGATION ROLE
# ============================================================

navigation_role:
These files are the root bridge between:
- reconciliation conclusions based on structure
and
- reconciliation hardening based on actual evidence

# ============================================================
# 3. REQUIRED ROOT LINKS
# ============================================================

required_root_links:
- DESIGN_MASTER_INDEX.md -> evidence capture set
- ERP_SYSTEM_MASTER_INDEX.md -> evidence capture set
- 126_ERP_RECONCILIATION_ROADMAP.md -> evidence capture set
- 127_ERP_RECONCILIATION_CURRENT_STATE.md -> evidence capture set
- 128_ERP_RECONCILIATION_NEXT_ACTIONS.md -> evidence capture set

# ============================================================
# 4. READING ORDER
# ============================================================

recommended_reading_order:
1. 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md
2. 150_ERP_EVIDENCE_CAPTURE_SET_INDEX.md
3. runtime capture documents
4. header capture documents
5. settlement / AR/AP capture documents
6. approval_request subfamily capture documents

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The evidence capture set must be root-navigable,
because reconciliation has now entered
an operational confirmation phase.
