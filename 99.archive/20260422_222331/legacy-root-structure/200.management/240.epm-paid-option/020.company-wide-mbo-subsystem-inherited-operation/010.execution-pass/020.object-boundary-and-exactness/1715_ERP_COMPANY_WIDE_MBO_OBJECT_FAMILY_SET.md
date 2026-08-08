# ============================================================
# ERP COMPANY WIDE MBO OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1715
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.object_family_set
component: company-wide-mbo-object-family-set


# PRIMARY OBJECT FAMILIES

- company_wide_mbo_program
- company_wide_mbo_objective_cascade
- company_wide_mbo_assignment_record
- company_wide_mbo_progress_review
- company_wide_mbo_evaluation_support_case

# RULE

MBO program is not objective cascade.
Objective cascade is not assignment record.
Assignment record is not progress review.
Progress review is not evaluation support case.

