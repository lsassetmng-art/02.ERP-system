# ============================================================
# ERP COMPANY WIDE MBO EXACT PAYLOAD GOAL REFERENCE AND CHECKIN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-891
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.exact_payload.goal_reference_and_checkin
component: company-wide-mbo-exact-payload-goal-reference-and-checkin


# OBJECT 1

mbo_individual_goal_reference

Canonical payload:
- object_id
- company_id
- object_type = mbo_individual_goal_reference
- status
- linked_objective_id
- external_personal_goal_reference_code
- person_reference_code
- reference_scope_code
- reference_status_code
- effective_from
- effective_to
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

mbo_progress_checkin

Canonical payload:
- object_id
- company_id
- object_type = mbo_progress_checkin
- status
- linked_objective_id
- linked_individual_goal_reference_id
- checkin_status_code
- checkin_period_code
- progress_summary
- blocker_summary
- confidence_code
- checked_in_at
- checked_in_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Goal reference is linkage truth.
Check-in is period progress truth.

