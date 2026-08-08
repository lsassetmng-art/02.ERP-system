# ============================================================
# ERP SHIFTMANAGER EXACT PAYLOAD_SWAP_AND_PUBLICATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-806
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.exact_payload.swap_and_publication
component: shiftmanager-exact-payload-swap-and-publication


# OBJECT 1

shift_swap_request

Canonical payload:
- object_id
- company_id
- object_type = shift_swap_request
- status
- source_assignment_id
- requested_by_staff_profile_id
- target_candidate_staff_profile_id
- swap_status_code
- request_reason
- requested_at
- reviewed_by
- reviewed_at
- executed_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

shift_publication_batch

Canonical payload:
- object_id
- company_id
- object_type = shift_publication_batch
- status
- shift_plan_id
- publication_status_code
- published_at
- published_by
- included_assignment_count
- visibility_scope_code
- notification_dispatch_status_code
- created_at
- created_by
- updated_at
- updated_by


# RULE

Swap request is not assignment change by itself.
Publication batch is governed publication truth, not just a UI event.

