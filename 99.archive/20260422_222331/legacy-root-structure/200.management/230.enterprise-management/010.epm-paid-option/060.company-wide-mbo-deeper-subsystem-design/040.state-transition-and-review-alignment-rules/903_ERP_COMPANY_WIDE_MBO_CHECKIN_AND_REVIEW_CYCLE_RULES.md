# ============================================================
# ERP COMPANY WIDE MBO CHECKIN AND REVIEW CYCLE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-903
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.checkin_and_review_cycle.rules
component: company-wide-mbo-checkin-and-review-cycle-rules


# CHECKIN STATUS SET

- draft
- submitted
- reviewed
- closed


# REVIEW SHEET STATUS SET

- draft
- in_review
- signed_off
- closed
- archived


# RULE

Submitted check-in is not reviewed check-in.
Signed-off review sheet is not final HR execution record.

