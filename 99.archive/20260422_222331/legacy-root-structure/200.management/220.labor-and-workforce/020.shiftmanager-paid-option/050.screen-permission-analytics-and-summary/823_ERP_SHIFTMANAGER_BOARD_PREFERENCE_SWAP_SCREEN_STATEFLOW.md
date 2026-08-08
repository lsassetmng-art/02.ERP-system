# ============================================================
# ERP SHIFTMANAGER BOARD PREFERENCE SWAP SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-823
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.board_preference_swap.screen_stateflow
component: shiftmanager-board-preference-swap-screen-stateflow


# PRIMARY STATES

- loading
- ready_with_items
- ready_empty
- preference_submission_open
- preference_submission_closed
- swap_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed


# RULE

Board drag/drop convenience must not bypass assignment,
swap, or publication governance.

