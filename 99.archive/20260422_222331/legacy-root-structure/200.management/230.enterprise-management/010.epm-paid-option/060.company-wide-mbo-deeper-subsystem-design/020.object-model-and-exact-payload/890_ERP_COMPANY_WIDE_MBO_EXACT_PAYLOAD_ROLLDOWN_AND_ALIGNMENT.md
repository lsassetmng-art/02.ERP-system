# ============================================================
# ERP COMPANY WIDE MBO EXACT PAYLOAD ROLLDOWN AND ALIGNMENT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-890
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.exact_payload.rolldown_and_alignment
component: company-wide-mbo-exact-payload-rolldown-and-alignment


# OBJECT 1

mbo_goal_rolldown_record

Canonical payload:
- object_id
- company_id
- object_type = mbo_goal_rolldown_record
- status
- source_objective_id
- target_objective_id
- rolldown_level_code
- rolldown_status_code
- rolldown_basis_code
- assigned_owner_user_id
- effective_from
- effective_to
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

mbo_alignment_link

Canonical payload:
- object_id
- company_id
- object_type = mbo_alignment_link
- status
- parent_objective_id
- child_objective_id
- alignment_status_code
- alignment_strength_code
- alignment_note
- checked_at
- checked_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Roll-down trace and alignment interpretation must remain distinct.

