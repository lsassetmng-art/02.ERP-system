# ============================================================
# ERP COMPANY WIDE MBO CASCADE REVIEW EVALUATION SUPPORT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1727
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.cascade_review_evaluation_support.rule
component: company-wide-mbo-cascade-review-evaluation-support-rule


# RULE

Cascade, progress review, and evaluation-support semantics must remain distinct.

Representative distinctions:
- cascaded objective is not assignment acceptance
- progress review is not evaluation support case
- evaluation support closure is not management decision closure
- inherited rollout is not personal_mbo completion

# CONSEQUENCE

Every cascade-class, review-class, or support-class action must preserve:
- original subsystem object reference
- reason
- actor
- timestamp
- downstream visibility

