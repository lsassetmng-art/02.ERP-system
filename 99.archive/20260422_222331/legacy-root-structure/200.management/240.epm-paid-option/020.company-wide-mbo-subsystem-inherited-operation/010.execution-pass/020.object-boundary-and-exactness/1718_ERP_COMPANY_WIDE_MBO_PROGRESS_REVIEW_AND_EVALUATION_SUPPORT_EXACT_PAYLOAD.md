# ============================================================
# ERP COMPANY WIDE MBO PROGRESS REVIEW AND EVALUATION SUPPORT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1718
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.progress_review_and_evaluation_support.exact_payload
component: company-wide-mbo-progress-review-and-evaluation-support-exact-payload


# OBJECT 1

company_wide_mbo_progress_review

Canonical payload:
- object_id
- company_id
- object_type = company_wide_mbo_progress_review
- status
- progress_review_code
- progress_review_status_code
- linked_assignment_record_id
- review_period_code
- reported_progress_value
- review_comment_text
- reviewed_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

company_wide_mbo_evaluation_support_case

Canonical payload:
- object_id
- company_id
- object_type = company_wide_mbo_evaluation_support_case
- status
- evaluation_support_case_code
- evaluation_status_code
- linked_assignment_record_id
- linked_progress_review_id
- evaluation_support_reason_code
- prepared_at
- created_at
- created_by
- updated_at
- updated_by

