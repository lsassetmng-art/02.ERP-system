# ============================================================
# ERP COMPANY WIDE MBO EXACT PAYLOAD REVIEW AND EVALUATION SUPPORT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-892
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.exact_payload.review_and_evaluation_support
component: company-wide-mbo-exact-payload-review-and-evaluation-support


# OBJECT 1

mbo_review_sheet

Canonical payload:
- object_id
- company_id
- object_type = mbo_review_sheet
- status
- linked_review_cycle_id
- linked_objective_id
- review_sheet_status_code
- reviewer_user_id
- reviewee_reference_code
- narrative_summary
- reviewed_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

mbo_evaluation_support_record

Canonical payload:
- object_id
- company_id
- object_type = mbo_evaluation_support_record
- status
- linked_review_sheet_id
- evaluation_support_status_code
- support_basis_code
- recommendation_code
- recommendation_note
- prepared_at
- prepared_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Review sheet is reviewer-side governed review material.
Evaluation-support record is supporting interpretation, not final HR execution truth.

