# ============================================================
# ERP EPM TARGET REVIEW VARIANCE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1690
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.target_review_variance.rule
component: epm-target-review-variance-rule


# RULE

Target, review-cycle, and variance semantics must remain distinct.

Representative distinctions:
- objective set is not scorecard snapshot
- scorecard snapshot is not variance case
- variance case closure is not management decision closure
- cycle closure is not company_wide_mbo completion closure

# CONSEQUENCE

Every target-class, scorecard-class, or variance-class action must preserve:
- original epm object reference
- reason
- actor
- timestamp
- downstream visibility

