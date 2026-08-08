# ============================================================
# ERP CRM OPTION AUDIT REVIEW SCREEN AND STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-702
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.audit_review_screen_and_stateflow
component: crm-option-audit-review-screen-and-stateflow


# PURPOSE

Defines the audit-review-side screen path for
CRM sensitive actions.


# PRIMARY REVIEW TARGETS

- merge results
- archive / unarchive actions
- owner reassignment history
- lifecycle controlled transitions
- inquiry reopen / closure override


# PRIMARY STATES

- review_list_loading
- review_list_ready
- review_detail_ready
- permission_denied
- review_failed


# RULE

Audit review screen is not an ordinary edit screen.

It exists to inspect:
- action trace
- previous state summary
- next state summary
- justification
- actor
- timing
- follow-up status

