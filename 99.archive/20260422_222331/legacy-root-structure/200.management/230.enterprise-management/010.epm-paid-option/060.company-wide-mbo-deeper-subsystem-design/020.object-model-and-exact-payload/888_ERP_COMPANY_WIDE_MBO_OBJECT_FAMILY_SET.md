# ============================================================
# ERP COMPANY WIDE MBO OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-888
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.object_family_set
component: company-wide-mbo-object-family-set


# PRIMARY OBJECT FAMILIES

- mbo_goal_rolldown_record
- mbo_alignment_link
- mbo_individual_goal_reference
- mbo_progress_checkin
- mbo_review_sheet
- mbo_evaluation_support_record


# RULE

Rolldown is not alignment.
Individual goal reference is not progress check-in.
Review sheet is not evaluation-support record.

