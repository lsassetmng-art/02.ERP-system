# ============================================================
# ERP SHIFTMANAGER PUBLICATION AND FINAL ROSTER STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-824
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.publication_and_final_roster.stateflow
component: shiftmanager-publication-and-final-roster-stateflow


# PRIMARY STATES

- publication_ready
- publication_confirmation_required
- publication_submitting
- publication_completed
- publication_failed
- superseded_view
- locked_reopen_confirmation_required
- permission_denied


# RULE

Published and superseded roster states must remain visible.
Final roster view must not erase publication history.

