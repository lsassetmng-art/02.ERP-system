# ============================================================
# ERP COMPANY WIDE MBO CHECKIN REVIEW EVALUATION CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-898
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.checkin_review_evaluation_contracts
component: company-wide-mbo-checkin-review-evaluation-contracts


# CHECKIN WRITE REQUEST BODY

- linked_objective_id
- linked_individual_goal_reference_id
- checkin_period_code
- progress_summary
- blocker_summary
- confidence_code


# REVIEW SHEET WRITE REQUEST BODY

- linked_review_cycle_id
- linked_objective_id
- reviewer_user_id
- reviewee_reference_code
- narrative_summary


# EVALUATION SUPPORT WRITE REQUEST BODY

- linked_review_sheet_id
- support_basis_code
- recommendation_code
- recommendation_note


# RULE

Check-in, review sheet, and evaluation-support creation
must remain separate controlled actions.

