# ============================================================
# ERP SFA OPTION BOARD DETAIL STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-747
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.board_detail.stateflow
component: sfa-option-board-detail-stateflow


# PRIMARY BOARD STATES

- loading
- ready_with_items
- ready_empty
- filter_updating
- option_disabled
- option_suspended
- permission_denied
- failed


# DETAIL STATES

- detail_loading
- detail_ready
- edit_dirty
- stage_transition_confirmation_required
- won_lost_confirmation_required
- invalid_transition_blocked
- audit_sensitive_confirmation_required
- save_failed


# RULE

Board lane movement must respect opportunity stage rules.
UI drag/drop convenience must not bypass transition governance.

