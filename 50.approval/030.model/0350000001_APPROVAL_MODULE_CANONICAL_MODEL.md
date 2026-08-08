# ============================================================
# APPROVAL MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 50.approval

Entities:
- approval_request
- approval_route
- approval_step
- approval_decision
- approval_delegation
- approval_result

Key fields:
approval_request:
- approval_request_id
- source_module
- source_reference_id
- request_type
- approval_status
- requested_by
- requested_at
- expires_at nullable

approval_step:
- approval_step_id
- approval_request_id
- step_no
- approver_id
- step_status
- acted_at nullable

Status canon:
- requested
- in_review
- approved
- rejected
- cancelled
- expired

Invariant:
- approval result is derived from recorded step decisions
- source reference is immutable inside approval request
