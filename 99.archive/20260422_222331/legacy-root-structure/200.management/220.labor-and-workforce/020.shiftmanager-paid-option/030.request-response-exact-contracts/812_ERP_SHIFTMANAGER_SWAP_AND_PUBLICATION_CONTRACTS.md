# ============================================================
# ERP SHIFTMANAGER_SWAP_AND_PUBLICATION_CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-812
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.swap_and_publication_contracts
component: shiftmanager-swap-and-publication-contracts


# SWAP REQUEST BODY

- source_assignment_id
- requested_by_staff_profile_id
- target_candidate_staff_profile_id
- request_reason


# SWAP REVIEW BODY

- object_id
- swap_status_code
- reviewed_by
- review_note


# PUBLICATION REQUEST BODY

- shift_plan_id
- visibility_scope_code
- notification_dispatch_requested_flag


# RULE

Publication must be separate from plan draft save.
Swap review must be separate from assignment edit.

